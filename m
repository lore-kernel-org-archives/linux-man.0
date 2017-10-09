From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man5/core.5 Piping core dumps to a program: ulimit -c
 restrictions does not apply when using pipe
Date: Mon, 9 Oct 2017 22:29:01 +0200
Message-ID: <0790cbcd-3275-409b-7077-3d3157ca4b53@gmail.com>
References: <d0d944e3f79246c28100f1d7fe042d7e@zenterio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d0d944e3f79246c28100f1d7fe042d7e-MFMeSrSslgZWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Per_B=c3=b6hlin?= <Per.Bohlin-MFMeSrSslgZWk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Per,

On 10/09/2017 05:22 PM, Per Böhlin wrote:
> The man page for coredumps:
> http://man7.org/linux/man-pages/man5/core.5.html
> 
> In section: Piping core dumps to a program
> should probably have a bullet explaining that the size limit > imposed by ulimit -c does not apply when using the> pipe-mechanism.

Thanks. From my reading of the kernel source, I agree.
I added the following text to the page:

       *  The RLIMIT_CORE limit is not enforced for core dumps  that  are
          piped to a program via this mechanism.

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
