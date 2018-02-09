From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: ffix
Date: Fri, 9 Feb 2018 07:02:53 +0100
Message-ID: <ad853aec-522e-cb6c-68d5-61dc57e87712@gmail.com>
References: <20180206005357.2407-1-lineprinter@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180206005357.2407-1-lineprinter-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elvira Khabirova <lineprinter-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Elvira,

On 02/06/2018 01:53 AM, Elvira Khabirova wrote:
> Signed-off-by: Elvira Khabirova <lineprinter-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>

Thanks. Patch applied.

Cheers,

Michael


> ---
>  man2/ptrace.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index e1c3eec46..bf59c09f8 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -1136,7 +1136,7 @@ be further subdivided into
>  .IR signal-delivery-stop ,
>  .IR group-stop ,
>  .IR syscall-stop ,
> -.IR PTRACE_EVENT stops,
> +.IR "PTRACE_EVENT stops" ,
>  and so on.
>  These stopped states are described in detail below.
>  .PP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
