From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sys_process_vm_readv, sys_process_vm_writev man pages?
Date: Fri, 25 Apr 2014 15:27:02 +0200
Message-ID: <CAKgNAkhc5fjL7cmxmNP3QPW5mMghO+mJJyWaJS7mGhxjY3LASQ@mail.gmail.com>
References: <20140425085514.1023bfc2@tomh>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140425085514.1023bfc2@tomh>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Horsley <horsley1953-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Tom,

On Fri, Apr 25, 2014 at 2:55 PM, Tom Horsley <horsley1953-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This bugzilla points me to the sys_process_vm_readv and
> sys_process_vm_writev system calls as though I should
> just obviously know what they are and how to call them :-).
>
> https://bugzilla.redhat.com/show_bug.cgi?id=790456
>
> There doesn't appear to be any man pages for them or
> even any notes in the kernel Documentation directory
> talking about them.
>
> Any chance someone who knows what the interface is
> could add a man page?

The man page was added about a year ago. I think you need to upgrade
your man-pages:

http://man7.org/linux/man-pages/changelog.html#release_3.40
http://man7.org/linux/man-pages/man2/process_vm_readv.2.html

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
