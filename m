From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Incorrect macro identifier IFNAMSZ in socket(7)
Date: Mon, 11 Dec 2017 20:00:48 +0100
Message-ID: <a53bb047-8304-1b2c-ad2c-dc33e8a8ad34@gmail.com>
References: <BL2PR20MB0756305B1710FB92E3610FB8C6320@BL2PR20MB0756.namprd20.prod.outlook.com>
 <BL2PR20MB0756697FB71B7924004FE4C5C6320@BL2PR20MB0756.namprd20.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BL2PR20MB0756697FB71B7924004FE4C5C6320-pJ+EGZ0oYmNvWg1M+eQXeE4Xiwx+OUlJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Williamson <jwilliamson-T1dms6jXtZNtdF/iL03xVDBc0kxJFkfs@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/06/2017 09:43 PM, Joel Williamson wrote:
> In the section of the socket(7) manpage describing SO_BINDTODEVICE,
> IFNAMSZ should be IFNAMSIZ.

Thanks, Joel. Fixed.

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
