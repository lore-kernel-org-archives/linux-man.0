From: Chris =?UTF-8?Q?=22=E3=82=AF=22?= Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Subject: Re: stat(2) can return EOVERFLOW
Date: Thu, 04 Dec 2008 14:41:19 -0500
Message-ID: <1228419679.22091.58.camel@linux.heathens.co.nz>
References: <20081204155355.GI16402@aym.net2.nerim.net>
	 <cfd18e0f0812041052v113510bbg389e8167758d1947@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0812041052v113510bbg389e8167758d1947-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael,

> +This can occur when an application compiled on a 32-bit platform without
> +.I -D_FILE_OFF_SET_BITS=64
> +calls
> +.BR stat ()
> +on a file whose size exceeds
> +.I (2<<31)-1
> +bits.

That should be _FILE_OFFSET_BITS.  :-)

Chris

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
