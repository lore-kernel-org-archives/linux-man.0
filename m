From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: locale.1: format fix
Date: Tue, 27 Jan 2015 14:10:07 +0900
Message-ID: <CALhU9tnjJxgk6ZUJLhjPGRoGWWwpDcTVyfSFC8jruk7jgDcd_w@mail.gmail.com>
References: <CALhU9tktwchejfJ9XgdKrjoUW=XMGbLyc0CPmChPqpNnprwgrQ@mail.gmail.com>
 <54C6B1B1.6070504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C6B1B1.6070504-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

I found these minor items during updating Japanese translation. It's
not an automatic process.
Japanese translations are maintained using po4a and
po4a converts bold or italic formatting into convenient strings
"B<connect>(2)" or "I<flags>".
Thus if formatting is not correct, when I hit strings like
B<connect(2)> or I<flags,>
I thought hmm... something is wrong and checked corresponding original
roff pages.
Since the winder vacation, I resumed the translations and have done
several minor updates.

P.S. Converting from roff to PO files is done by perkamon
http://perkamon.alioth.debian.org/.

Thanks,
Akihiro


2015-01-27 6:29 GMT+09:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Thanks, Akihiro. Applied.
>
> By the way, how are you discovering all of these small errors?
>
> Thanks,
>
> Michael
>
>
> On 01/26/2015 05:21 PM, Akihiro Motoki wrote:
>> diff --git a/man1/locale.1 b/original/man1/locale.1
>> index ef240be..650a36e 100644
>> --- a/man1/locale.1
>> +++ b/man1/locale.1
>> @@ -65,7 +65,7 @@ metadata about each locale to be included in the output.
>>  Display the available charmaps (character set description files).
>>  .PP
>>  The
>> -.I locale
>> +.B locale
>>  command can also be provided with one or more arguments,
>>  which are the names of locale keywords (for example,
>>  .IR date_fmt ,
>> @@ -108,7 +108,7 @@ so that the output has the format:
>>      \fIkeyword\fP="\fIvalue\fP"
>>  .PP
>>  The
>> -.I locale
>> +.B locale
>>  command also knows about the following options:
>>  .TP
>>  .BR \-v ", " \-\-verbose
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
