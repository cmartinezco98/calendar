import { Body, Controller, Get } from '@nestjs/common';
import { MailService } from './mail.service';
import { CreateMailerDto } from './dto/create-mailer.dto';

@Controller('mailer')
export class MailController {
  constructor(private readonly mailService: MailService) { } s
  @Get()
  sendMail(@Body() dataEmail: CreateMailerDto) {
    return this.mailService.sendMail(dataEmail);
  }
}