<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Mail\SendMailL;
use Illuminate\Support\Facades\Mail;
use App\Models\Cron_job_mail;
class SendMail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'word:day';

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
        foreach ($jobs as $c) {
            $mail = Mail::to($c->to_email)->send(new SendMailL($c));
            $cron_email = Cron_job_mail::find($c->id);
            $cron_email->delete();
        }

        $this->info('Envio realizado con exito ');

    }
}
