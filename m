From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15568] O_NONBLOCK is NOOP on block devices
Date: Tue, 11 May 2010 08:43:45 GMT
Message-ID: <201005110843.o4B8hjeZ003212@demeter.kernel.org>
References: <bug-15568-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-15568-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15568





--- Comment #3 from Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>  2010-05-11 08:43:41 ---
Mike, I have not meant covering for some possible old versions, but covering
for future versions; if you know which version the man-page documents, you can
decide if you need to check further to see if your version has something new
there.

I don't know who was the original author describing O_NONBLOCK. I have never
really tended to misinterpret this myself, "Many  file  systems and disks were
considered to be fast enough that the implementation of O_NONBLOCK was deemed
unnecessary.  So, O_NONBLOCK may not be available on files and/or disks" seemed
always rather clear to me, but I agree more detail and mentioning this at other
places than read(2) documentation as well would do good.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
