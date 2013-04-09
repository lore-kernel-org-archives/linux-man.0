From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: clone(2) should be clone(3)
Date: Tue, 09 Apr 2013 20:57:12 +0200
Message-ID: <51646488.9080708@redhat.com>
References: <515EF542.8090200@redhat.com> <CAKgNAkiRHNZsnWj0J3hizbMRtnq6yAbJpFSr0x_-77bu_9eFXA@mail.gmail.com> <51645912.5080602@redhat.com> <201304091411.12265.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304091411.12265.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/09/2013 08:11 PM, Mike Frysinger wrote:
> On Tuesday 09 April 2013 14:08:18 Peter Schiffer wrote:
>> My aim here is, that when I'm opening man page in section 2, the first
>> thing I'm expecting to see is syscall signature. In clone(2), it's not
>> even clear that this is a library call.
>
> err, the very first sentence of the first paragraph says it's exactly this:
> 	clone() creates a new process, in a manner similar to fork(2).  It is
> 	actually a library function layered on top of the underlying clone()
> 	system call, hereinafter referred to as sys_clone.  A description of
> 	sys_clone is given toward the end of this page.
> -mike
>

Yeah, I know. But you have to read the description to know that.
Problem is, that if you are familiar with the call, you won't read the
description (for example, if you just forgot the signature).

Another real world example: we work with many experienced developers
used to other Unices, so, you can try to imagine how unfortunate for
them this can be.

Also, we are afraid that this doesn't have to complain with the Common
Criteria. Every syscall has to be documented, so when I'm looking for
the documentation of clone(2) syscall in the clone(2) man page, I'm
expecting that it will be the main topic in the page, and in the
synopsis.

I'm just trying to prevent possible misunderstandings, and if possible,
make the page little bit more clearer..

peter
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
