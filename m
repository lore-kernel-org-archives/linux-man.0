From: Otto Ebeling <oebeling-YEAOTlfEoH7f77WrBdCPMDwVj7d+iGoU@public.gmane.org>
Subject: Re: [patch] Update move_pages(2) manpage to match kernel change
Date: Tue, 22 Aug 2017 09:14:58 +0100
Message-ID: <94ae97965e44ee23301c31a114577315@github.mail.kapsi.fi>
References: <e6c853bb0a1dd5f96133a754024f230c@github.mail.kapsi.fi>
 <2646ef81-62da-13d5-2793-18149df3659b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2646ef81-62da-13d5-2793-18149df3659b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

> 
>        To  move  pages  in  another process requires the following 
> privi‐
>        leges:
> 
>        *  In kernels up to and including Linux 4.12: the caller  must  
> be
>           privileged  (CAP_SYS_NICE)  or the real or effective user ID 
> of
>           the calling process must match the real or saved-set user ID 
> of
>           the target process.
> 
>        *  The  older rules allowed the caller to discover various 
> virtual
>           address choices made by the  kernel  that  could  lead  to  
> the
>           defeat  of  address-space-layout  randomization  for  a 
> process
>           owned by the same UID as the caller,  the  rules  were  
> changed
>           starting with Linux 4.13.  Since Linux 4.13, permission is 
> gov‐
>           erned by a ptrace access mode PTRACE_MODE_READ_REALCREDS  
> check
>           with respect to the target process; see ptrace(2).
> 
> Look okay?

Thanks for fixing that up, makes sense to document the historical 
behavior! Regarding the references to "Linux 4.13", I wanted to point 
out I got emails that indicate the patch was/will be merged to 
"3.18-stable tree, 4.12-stable tree, 4.4-stable tree, 4.9-stable". See 
e.g. 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/commit/?id=b52c5821b05b33af36b77ba5cfee54818828508f

Not sure how to word this in a man page - maybe something like "4.13, 
and updated versions of 3.18, 4.12, 4.4, and 4.9". What do you think?

Otto
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
