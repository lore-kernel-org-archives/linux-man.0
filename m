From: Ihar Hrachyshka <ihar.hrachyshka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Typo in getprotoent(3)
Date: Tue, 16 Feb 2010 13:38:51 +0200
Message-ID: <1266320331.2302.25.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi! Here is a little bug in man-pages:

SEE ALSO
       getnetent(3), getprotent_r(3), getservent(3), protocols(5)

There should be 'getprotoent_r', not 'getprotent_r'.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
