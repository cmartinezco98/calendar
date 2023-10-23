import { Module } from '@nestjs/common';
import { MailService } from './mail.service';
import { MailController } from './mail.controller';
import { MailerModule } from '@nestjs-modules/mailer';

@Module({
  imports: [
    MailerModule.forRoot({
      transport: {
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
          user: "cmartinezcodev@gmail.com",
          pass: "rlpw fsys kwxt zdfx"
        }
      }
    }),
  ],
  controllers: [MailController],
  providers: [MailService],
})
export class MailModule { }
