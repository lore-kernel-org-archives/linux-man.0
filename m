From: Cortland Setlow <cortland.setlow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Clarification for man 7 packet: sll_family is used for binding.
Date: Thu, 16 Jun 2011 13:59:01 -0400
Message-ID: <BANLkTimpAp+pk=1Zb5i9twCKPC50NA_d8w@mail.gmail.com>
References: <BANLkTi=ZhuSVkOEGsV8G+DT+SJjBgSpQAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTi=ZhuSVkOEGsV8G+DT+SJjBgSpQAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

In the packet (7) manpage ( I retrieved the HTML version from
kernel.org today ) it says
"For bind only sll_protocol and=A0sll_ifindex are used." but I get
EINVAL unless I also
use sll_family. =A0Could you amend this sentence to say that sll_family
is used for binding?
Granted, the man page already says that sll_family is always AF_PACKET,
but it wasn't very clear to me. =A0Either way, best regards.

--Cortland Setlow.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
