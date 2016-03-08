From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: locale.5: drop tel/fax description
Date: Tue, 08 Mar 2016 14:03:18 +0100
Message-ID: <56DECD96.5090008@bfs.de>
References: <56DD6B93.8070802@redhat.com> <20160307174850.GI6588@vapier.lan> <56DEA266.2000400@redhat.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DEA266.2000400-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Am 08.03.2016 10:59, schrieb Marko Myllynen:
> On 2016-03-07 19:48, Mike Frysinger wrote:
>> On 07 Mar 2016 13:52, Marko Myllynen wrote:
>>> glibc upstream recently deemed that the tel/fax fields are not useful
>>> and dropped them from the few locales which had them defined. Do you
>>> think we could/should drop the descriptions from the man page as well?
>>
>> the fields are technically still supported, we've just emptied them out.
>> i would add a note saying that their use is discouraged in favor of the
>> other fields like e-mail.
> 
> Fair enough, how about this?
> 
> ---
>  man5/locale.5 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index 0a26f91..ef97f00 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -572,10 +572,14 @@ organization that maintains this document.
>  .I tel
>  followed by the telephone number (in international format)
>  of the organization that maintains this document.
> +As of glibc 2.24, this keyword is deprecated in favor of
> +other contact methods.
>  .TP
>  .I fax
>  followed by the fax number (in international format)
>  of the organization that maintains this document.
> +As of glibc 2.24, this keyword is deprecated in favor of
> +other contact methods.
>  .TP
>  .I language
>  followed by the name of the language to which this document applies.
> 
> Thanks,
> 

I think "As of glibc 2.24, this keyword is deprecated" is enought.
Otherwise it may spark discussions.

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
