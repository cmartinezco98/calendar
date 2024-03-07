import { Body, Controller, Get } from '@nestjs/common';
import { CreateMailerDto } from './dto/create-mailer.dto';
import { MailService } from './mail.service';

@Controller('mailer')
export class MailController {
  constructor(private readonly mailService: MailService) { }
  @Get()
  sendMail(@Body() dataEmail: CreateMailerDto) {
    return this.mailService.sendMail(dataEmail);
  }
}