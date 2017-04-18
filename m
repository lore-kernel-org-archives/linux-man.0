From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Describe accepted characters for hostname
Date: Tue, 18 Apr 2017 22:03:49 +0200
Message-ID: <9ee544fa-1cfa-ce20-81e9-e801e9a6ab91@redhat.com>
References: <17d13448-3659-9e7e-7e7d-745a2780cfa1@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17d13448-3659-9e7e-7e7d-745a2780cfa1-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/18/2017 12:54 PM, Marko Myllynen wrote:
> Perhaps this is helpful. The HOSTALIASES section looks outdated given that
> getaddrinfo(3) should be used but I'm not sure what should be done with it.

HOSTALIASES is still processed with getaddrinfo, I think.  It's a very 
low-level mapping within the stub resolver.

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
