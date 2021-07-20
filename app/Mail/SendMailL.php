<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendMailL extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */

    public $data; 

    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {

        foreach ($this->data as $mail) {
            // code...
            $fromstatus = (!empty($mail->from_email)) ? true : false;
            $mail =  $this->subject('Nuevo Mensaje')->from(config('mail.mailers.smtp.username'),config('app.name'))->view('mail.NewTicket',['data'=>$this->mail,'from'=>$fromstatus]);
        }
    }
}
