From: Florian Weimer <fw-d32yF4oPJVt0XxTmqZlbVQ@public.gmane.org>
Subject: Re: getentropy clarifications
Date: Fri, 31 Mar 2017 13:31:21 +0200
Message-ID: <87pogxlm2e.fsf@mid.deneb.enyo.de>
References: <1490791607.28079.8.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490791607.28079.8.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Nikos Mavrogiannopoulos's
        message of "Wed, 29 Mar 2017 14:46:47 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* Nikos Mavrogiannopoulos:

> +In earlier versions of glibc this function was avaible under the
> +.BR <sys/random.h>
> +header.

It's still available in <sys/random.h>, and the declaration there can
still be useful if you want to compile without feature test macros.

In addition, I don't think there ever was a released glibc version
where getentropy was declared in <sys/random.h>, but not in <unistd.h>
(with the relevant feature test macros).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
