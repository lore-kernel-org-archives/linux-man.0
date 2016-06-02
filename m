From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] assert.3: improved description
Date: Thu, 2 Jun 2016 18:35:25 -0500
Message-ID: <dce9e3be-8461-2d09-197d-424a64eed8b7@gmail.com>
References: <1464858451.5804.3.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464858451.5804.3.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Nikos,

On 06/02/2016 04:07 AM, Nikos Mavrogiannopoulos wrote:
> Removed text referring to text not being helpful to users. Provide
> the error text instead to allow the reader to determine whether it is helpful.
> Recommend against using NDEBUG for programs to excibit deterministic behavior.
> Moved description ahead of recommendations.

The patch concept seems good to me, butfor some reason it does not apply.
Could you check against latest git please?

Thanks,

Michael


> Signed-off-by: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man3/assert.3 | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/man3/assert.3 b/man3/assert.3
> index 7cf7328..1b85a68 100644
> --- a/man3/assert.3
> +++ b/man3/assert.3
> @@ -24,6 +24,7 @@
>  .\"
>  .\" Modified Sat Jul 24 21:42:42 1993 by Rik Faith <faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org>
>  .\" Modified Tue Oct 22 23:44:11 1996 by Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
> +.\" Modified Thu Jun  2 23:44:11 2016 by Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  .TH ASSERT 3  2015-08-08 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  assert \- abort the program if assertion is false
> @@ -34,26 +35,26 @@ assert \- abort the program if assertion is false
>  .BI "void assert(scalar " expression );
>  .fi
>  .SH DESCRIPTION
> +This macro can help programmers find bugs in their programs, or handle exceptional cases
> +via a crash that will produce limited debugging output. The function will print an
> +error message to standard error, e.g., "assertion failed in file foo.c, function do_bar(), line 1287"
> +and terminate the program by calling
> +.BR abort (3)
> +if
> +.I expression
> +is false (i.e., compares equal to zero).
> +.LP
>  If the macro
>  .B NDEBUG
> -was defined at the moment
> +is defined at the moment
>  .I <assert.h>
>  was last included, the macro
>  .BR assert ()
> -generates no code, and hence does nothing at all.
> -Otherwise, the macro
> +generates no code, and hence does nothing at all. It is not recommended to define 
> +.B NDEBUG
> +if using
>  .BR assert ()
> -prints an error message to standard error and terminates the program
> -by calling
> -.BR abort (3)
> -if
> -.I expression
> -is false (i.e., compares equal to zero).
> -.LP
> -The purpose of this macro is to help programmers find bugs in
> -their programs.
> -The message "assertion failed in file foo.c, function
> -do_bar(), line 1287" is of no help at all to a user.
> +to detect error conditions since the software may behave non-deterministically.
>  .SH RETURN VALUE
>  No value is returned.
>  .SH ATTRIBUTES
> -- 
> 2.5.5
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
