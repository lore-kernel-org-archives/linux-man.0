From: =?UTF-8?B?0JzQuNGF0LDQudC70L7QsiDQodC10YDQs9C10Lk=?=
	<pishisyda-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Subject: man 3 feof extension
Date: Tue, 28 May 2013 09:30:50 +0600
Message-ID: <20130528093050.038032fe@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi. I think it should be mentioned, that feof indicates eof only if the
previous read had not red any bytes at all. And if it red, lets say, 1
byte from 10 that was requested, it does not indicate feof. It was not
obvious for me.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
