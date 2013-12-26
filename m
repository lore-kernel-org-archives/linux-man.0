From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] man7/boot.7 fix typo, do -> to
Date: Fri, 27 Dec 2013 07:41:22 +1300
Message-ID: <52BC7852.6050204@gmail.com>
References: <52A9FA1A.10201@theta.pw>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52A9FA1A.10201-rDlnuv1X39s@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Smith <james-rDlnuv1X39s@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/13/13 07:02, James Smith wrote:
> --- boot.7	2013-12-12 11:58:38.313526985 -0600
> +++ boot.7.new	2013-12-12 11:59:21.840196174 -0600
> @@ -143,7 +143,7 @@
>  \&"stop" \-\- causing it to stop the service.
>  The script may optionally
>  accept other "convenience" parameters (e.g: "restart", to stop and then
> -start, "status" do display the service status).
> +start, "status" to display the service status).
>  Running the script
>  without parameters displays the possible arguments.
>  .SS Sequencing directories

Thanks, James. Applied.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
