<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendTicket extends Mailable
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
        if (isset($this->data['apertura_email'])) {
            $mail =  $this->subject('Nuevo Ticket')->from(config('mail.mailers.smtp.username'),config('app.name'))->view('mail.emisor',['data'=>$this->data]);
        }else{
            $mail =  $this->subject('Nuevo Ticket')->from(config('mail.mailers.smtp.username'),config('app.name'))->view('mail.index',['data'=>$this->data]);
        }
   
        return $mail;    
    }
}
