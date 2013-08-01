From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] typo and formatting fix in console_ioctl.4
Date: Thu, 1 Aug 2013 18:46:09 +0900
Message-ID: <CALhU9tknPzYN3ESofnngmJ7XO7D=Ohq-jS949WQBxp_4Rfi+tw@mail.gmail.com>
References: <CALhU9t=2j59Xao34NW9Sc38SCDV4m__dZtHY1M0vHLC=XO6U9Q@mail.gmail.com>
	<51FA2B09.2030409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51FA2B09.2030409-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

I will make sure to check the lastest git first when I find something wrong.
Thanks for fixing.

Akihiro

On Thu, Aug 1, 2013 at 6:31 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 07/30/13 22:22, Akihiro MOTOKI wrote:
>> typo and formatting fix in console_ioctl.4
>
> Hello Akihiro,
>
> Of these three changes, I believe the first and last were
> already fixed. (As Simon notes, it's best to work from the latest Git.)
> I applied the second change.
>
> Cheers,
>
> Michael
>
>
>> diff --git a/manual/LDP_man-pages/original/man4/console_ioctl.4
>> b/manual/LDP_man-pages/original/man4/console_ioctl.4
>> index 5cb3e2f..6918b24 100644
>> --- a/manual/LDP_man-pages/original/man4/console_ioctl.4
>> +++ b/manual/LDP_man-pages/original/man4/console_ioctl.4
>> @@ -213,7 +213,7 @@ and
>>  .I charheight
>>  are filled with
>>  the respective data for the currently loaded font, and the
>> -.I hardata
>> +.I chardata
>>  array contains the font data if the initial value of
>>  .I charcount
>>  indicated enough space was available; otherwise the
>> @@ -241,7 +241,6 @@ This call also invalidates the Unicode mapping.
>>  .B PIO_FONTX
>>  Sets screen font and associated rendering information.
>>  .I argp
>> -
>>  points to a
>>
>>  .in +4n
>> @@ -285,7 +284,7 @@ Get full Unicode screen mapping from kernel.
>>  .I argp
>>  points to an
>>  area of size
>> -.IR E_TABSZ*sizeof(unsigned short) ,
>> +.IR "E_TABSZ*sizeof(unsigned short)" ,
>>  which is loaded with the
>>  Unicodes each character represent.
>>  A special set of Unicodes,
>>
>



-- 
Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
