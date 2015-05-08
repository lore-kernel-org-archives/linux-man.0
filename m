From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: getopt.3
Date: Fri, 08 May 2015 22:49:36 +0100
Message-ID: <554D2F70.4050306@jguk.org>
References: <CAGc9EveyW=7Oy2NBfy+V2kjEHhzxkY5Keh2+eU_hff8kbBQt9Q@mail.gmail.com>	<CAKgNAkgqpVDzuCHRTWY3=pnBvoV4Roe3FU6yjj=KV8rFBXBG5A@mail.gmail.com> <CAGc9EvfEfGEfw5Fr3tvoJxrRbTJzps9y=Xbt0G4cZxeU1OSk-Q@mail.gmail.com> <5548CF67.3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5548CF67.3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



On 05/05/15 15:10, Michael Kerrisk (man-pages) wrote:
> On 05/01/2015 12:10 AM, Jonny Grant wrote:
>> #include <unistd.h>
>> #include <stdlib.h>
>> #include <stdio.h>
>>
>> int
>>         main(int argc, char *argv[])
>> {
>>     int flags, opt;
>>     int nsecs, tfnd;
>>
>>     nsecs = 0;
>>     tfnd = 0;
>>     flags = 0;
>>     while ((opt = getopt(argc, argv, "nt:")) != -1) {
>>         switch (opt) {
>>         case 'n':
>>             flags = 1;
>>             break;
>>         case 't':
>>             nsecs = atoi(optarg);
>>             tfnd = 1;
>>             break;
>>         default: /* '?' */
>>             fprintf(stderr, "Usage: %s [-t nsecs] [-n] name\n",
>>                     argv[0]);
>>             exit(EXIT_FAILURE);
>>         }
>>     }
>>
>>      return 0;
>> }
>
> It looks like you are looking at a (very) old version
> of the page. That code does not match the example in
> the current man page.

Apologies, unsure where I got that old code from.
Latest code compiles ok for me too.
Regards, Jonny
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
