From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Describe accepted characters for hostname
Date: Wed, 26 Apr 2017 13:08:31 +0300
Message-ID: <f6364d0b-6de1-88ee-bf2a-885f6ed598b4@redhat.com>
References: <17d13448-3659-9e7e-7e7d-745a2780cfa1@redhat.com>
 <9ee544fa-1cfa-ce20-81e9-e801e9a6ab91@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9ee544fa-1cfa-ce20-81e9-e801e9a6ab91-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 2017-04-18 23:03, Florian Weimer wrote:
> On 04/18/2017 12:54 PM, Marko Myllynen wrote:
>> Perhaps this is helpful. The HOSTALIASES section looks outdated given
>> that
>> getaddrinfo(3) should be used but I'm not sure what should be done
>> with it.
> 
> HOSTALIASES is still processed with getaddrinfo, I think.  It's a very
> low-level mapping within the stub resolver.

You're right, thanks for confirming it off-list as well. So no changes
needed for hostname.7.

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
