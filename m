From: Joel Williamson <jwilliamson-T1dms6jXtZNtdF/iL03xVDBc0kxJFkfs@public.gmane.org>
Subject: Incorrect macro identifier IFNAMSZ in socket(7)
Date: Wed, 6 Dec 2017 20:43:23 +0000
Message-ID: <BL2PR20MB0756697FB71B7924004FE4C5C6320@BL2PR20MB0756.namprd20.prod.outlook.com>
References: <BL2PR20MB0756305B1710FB92E3610FB8C6320@BL2PR20MB0756.namprd20.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BL2PR20MB0756305B1710FB92E3610FB8C6320-pJ+EGZ0oYmNvWg1M+eQXeE4Xiwx+OUlJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-CA
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

In the section of the socket(7) manpage describing SO_BINDTODEVICE, IFNAMSZ=
 should be IFNAMSIZ.

Joel Williamson    =
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
