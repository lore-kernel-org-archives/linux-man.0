From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [LTP] [PATCH V3 07/23] ptrace: Use int instead of enum
 __ptrace_request
Date: Tue, 26 Jul 2016 18:03:30 +0200
Message-ID: <20160726160329.GD5868@rei>
References: <20160722042656.22346-1-raj.khem@gmail.com>
 <20160722042656.22346-7-raj.khem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160722042656.22346-7-raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ltp-cunTk1MwBs91InPhgRC9rw@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
> __ptrace_request is only available with glibc
> 
> Signed-off-by: Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  testcases/kernel/syscalls/ptrace/ptrace03.c           | 2 +-
>  testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/ptrace/ptrace03.c b/testcases/kernel/syscalls/ptrace/ptrace03.c
> index a4028fc..f326b83 100644
> --- a/testcases/kernel/syscalls/ptrace/ptrace03.c
> +++ b/testcases/kernel/syscalls/ptrace/ptrace03.c
> @@ -102,7 +102,7 @@ static pid_t unused_pid;
>  static pid_t zero_pid;
>  
>  struct test_case_t {
> -	enum __ptrace_request request;
> +	int request;
>  	pid_t *pid;
>  	int exp_errno;
>  } test_cases[] = {
> diff --git a/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h b/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
> index ae538e9..83de9b4 100644
> --- a/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
> +++ b/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
> @@ -130,7 +130,7 @@ static char *strings[] = {
>  	SPT(KILL)
>  	SPT(SINGLESTEP)
>  };
> -static inline char *strptrace(enum __ptrace_request request)
> +static inline char *strptrace(int request)
>  {
>  	return strings[request];
>  }

The enum __ptrace_request is used to describe the function prototype in
the ptrace() manual page so one can argue that it's part of the official
API.

If I remeber right, it's missing in musl libc and the code in question
fails to compile.

CCing glibc ML and also man-pages ML to see if the type is used in
manual page intentionally or not.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
