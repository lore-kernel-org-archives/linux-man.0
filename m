From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail-7wQd5C9ZzNw@public.gmane.org>
Subject: Re: net.ipv4.tcp_rmem does override net.core.rmem_max?
Date: Tue, 16 Feb 2016 18:05:41 +0100
Message-ID: <56C356E5.8010004@nh2.me>
References: <56C35692.7010807@nh2.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C35692.7010807-7wQd5C9ZzNw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

An answer to the question I just posted,

  http://stackoverflow.com/a/35438236/263061

suggests that neither is the case, but in fact the kernel takes the
maximum of the two values.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
