<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Mail\SendMailL;
use App\Service\PhpMailerCustom;

use Illuminate\Support\Facades\Mail;
use App\Models\Cron_job_mail;
class SendMail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'work:email';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Envio de correo masivos para los casos y sus actualizaciones';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        $jobs = Cron_job_mail::take(4)->get();

        $email = new PhpMailerCustom();

        foreach ($jobs as $c) {

            if ($c->type_email == 1) {
                $subject = 'Informacion nuevo ticket';
                $template = 'mail.NewTicket';
                $data = ['data'=>$c];

                //Envio el correo al usuario que creo el ticket 
                $email->email_to = $c->from_email;
                $email->subject = $subject;
                $email->init_email($template,['data'=>$c,'from'=>true]);
           
            }
            if ($c->type_email == 2) {
                $subject = 'Nuevo Mensaje';
                $template = 'mail.NewMessage';
                $data = ['data'=>$c];
            }

            //Multiples destinatarios.....
            foreach (json_decode($c->to_json) as $user) {
                //Envio el correo a los destinarios
                $email->email_to = $user->email;
                $data += [ "to_name" => $user->name ];
                $email->subject = $subject;
                $email->init_email($template,$data);
            }


            $cron_email = Cron_job_mail::find($c->id);
            $cron_email->delete();
        }

        $this->info('Envio realizado con exito ');

    }
}
