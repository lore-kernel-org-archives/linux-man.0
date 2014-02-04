From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for tcp.7
Date: Tue, 04 Feb 2014 09:57:52 +0100
Message-ID: <52F0AB90.2080204@gmail.com>
References: <20140201185459.14c29a9b@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140201185459.14c29a9b-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

(Manually) applied.

Thanks,

Michael


On 02/01/2014 03:54 PM, Yuri Kozlov wrote:
> Hello.
> 
>  .IR "unsigned int"
>  as an argument.
>  When the value is greater than 0,
> -it specifies the maximum amount of time in imilliseconds that transmitted
> +it specifies the maximum amount of time in milliseconds that transmitted
>  data may remain unacknowledged before TCP will forcibly close the
>  corresponding connection and return
>  .B ETIMEDOUT
> @@ -1040,7 +1040,7 @@ Increasing user timeouts allows a TCP connection to survive e$
>  periods without end-to-end connectivity.
>  Decreasing user timeouts
>  allows applications to "fail fast", if so desired.
> -Otherwise, failure may take upto 20 minutes with
> +Otherwise, failure may take up to 20 minutes with
>  the current system defaults in a normal WAN environment.
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
