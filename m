From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Thu, 28 Mar 2013 10:37:15 +0100
Message-ID: <CAKgNAkjWaPbwRqYKP+2h+ex9QnxBhbebLAHOh=4N5qk6-ci0Hw@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364361092-5948-1-git-send-email-ch0.han-Hm3cg6mZ9cc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ch0.han-Hm3cg6mZ9cc@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gunho.lee-Hm3cg6mZ9cc@public.gmane.org, Changhee Han <gyulkkajo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Mar 27, 2013 at 6:11 AM,  <ch0.han-Hm3cg6mZ9cc@public.gmane.org> wrote:
> From: Changhee Han <gyulkkajo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Add notes that caution users when passing arguments to syscall.2.
>
> Signed-off-by: Changhee Han <gyulkkajo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/syscall.2 |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/man2/syscall.2 b/man2/syscall.2
> index 0675943..2c823b6 100644
> --- a/man2/syscall.2
> +++ b/man2/syscall.2
> @@ -79,6 +79,15 @@ and an error code is stored in
>  .BR syscall ()
>  first appeared in
>  4BSD.
> +
> +On some architecture arguments should be passed with an appropriate way.
> +The glibc wrapper function, described in
> +.BR syscalls (2),
> +copies arguments to the right registers denpend on the architecture but
> +.BR syscall (2)
> +needs arguments following ABI, which its architecture describes, to be passed manually by a user.
> +For example, on ARM architecture, a long long type of argument is considered to be 8-byte aligned and to be split into two 4-byte arguments.

Changhee,

I think this is a very worthwhile patch, but needs a bit of
clarification. How would text such as this be:

[[
Each architecture ABI has its own requirements on how system call
arguments are passed to the kernel.
For system calls that have a glibc wrapper (i.e., most system calls)
glibc handles the details of copy arguments to the right registers
in a manner suitable for the architecture.
However, when using
.BR syscall ()
to make a system call,
the caller may need to handle architecture-dependent details.
For example, on the ARM architecture, a
.I "long long"
argument is considered to be 8-byte aligned
and to be split into two 4-byte arguments.
]]

Would that text be okay?

And then, in addition to that it would be good to have an example of
how one uses syscall() on ARM to invoke a system call with an 8-byte
aligned argument. Could you provide an example?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
