From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RHEL man pages type - popen(3) "errnro"
Date: Tue, 31 May 2016 20:04:08 -0500
Message-ID: <CAKgNAkg03ADuvbboCDek46OZqya5Rc4+cFW72v9zZ6D2XWJ8jg@mail.gmail.com>
References: <20160531202855.F3E89B204E@b01ledav03.gho.pok.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160531202855.F3E89B204E-jxtXAbmmQznzwXz9eL2nSbq9uwJ/xSLv0E9HWUfgJXw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Reynolds <jpreyno-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Joseph

On 31 May 2016 at 15:28, Joseph Reynolds <jpreyno-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> wrote:
>
> Bug report:
>
> The pclose(3) man page has a typo: errno is misspelled errnro:

You're looking at a very old version of the man pages. That typo was
fixed nearly three years ago. Always worth checking the latest
versions online at http://man7.org/linux/man-pages/index.html

Cheers,

Michael


> > uname -rsvo
> Linux 3.10.0-229.4.2.el7.x86_64 #1 SMP Fri Apr 24 15:26:38 EDT 2015 GNU/Linux
> > man pclose | grep errnro
>        tions set errnro to indicate the cause of the error.
>
>
> Joseph Reynolds
> Software Engineer - IBM Analytics | InfoSphere Streams | Eden KVS
> ________________________________
> Phone:    1-507-253-3002
> Tie line:   553-3002
> E-Mail:    jpreyno-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org 3601 HW 52 North
> Rochester MN, 55901
> USA
> ________________________________
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
