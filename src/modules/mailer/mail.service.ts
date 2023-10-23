import { Injectable } from '@nestjs/common';
import { CreateMailerDto } from './dto/create-mailer.dto';
import { MailerService } from '@nestjs-modules/mailer';

@Injectable()
export class MailService {
  constructor(private mailerService: MailerService) { }

  async sendMail({ n_user, n_email, n_task }: CreateMailerDto) {
    await this.mailerService.sendMail({
      to: `<${n_email}>`,
      from: "cmartinezcodev@gmail.com",
      subject: `Hola ${n_user}, creaste una nueva tarea en Calendar`,
      text: `Area XXXX`,
      html: `<b>${n_task}<b>`
    })
    return `Email enviado`;
  }
}
