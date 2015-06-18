From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] hosts.equiv.5: Fix format, clarify IdM needs, and provide examples.
Date: Thu, 18 Jun 2015 08:34:52 +0200
Message-ID: <CAKgNAkjK89FgqHPMp2znUvO2jYyiHmTreLPZc7DwG8LV-RP33w@mail.gmail.com>
References: <55615A71.4010600@redhat.com> <557FF511.7040500@gmail.com>
 <558091DD.30004@redhat.com> <20150617181755.0bea170c@zion>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150617181755.0bea170c@zion>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arjun Shankar <arjun-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 17 June 2015 at 18:17, Arjun Shankar <arjun-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> > Just a note: I'm hoping for a response from Arjun before I commit this.
>> Hope is not a plan :-)
>
> I see that I got here a little late. This looks good, but I have one
> nitpick:
>
>> +Allow user from host to login:
>> +.LP
>> +.RS 4
>> +.TP
>> +host user
>
> It might make sense to repeat here that such an entry will allow the
> specified user on the remote host to login as *any* user on the local host.
>
> i.e., something like:
>
> -Allow user from host to login:
> +Allow user from host to login as any non-root user:

Arjun: thanks. I've made that change.

Carlos: when you have a moment, please review the current draft in Git
and let me know if  my edits injected any errors.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
