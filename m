From: kalle <kalle-hsXoOLftXaMrK3VXJnZBaRvVK+yQ3ZXh@public.gmane.org>
Subject: mount: /etc/fstab
Date: Sun, 22 Oct 2017 10:17:33 +0200
Message-ID: <a131e54b-3b51-35d5-52b7-2908a01c4d1f@projektwerkstatt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In the sentence "then mount looks for a mountpoint and if not found then
for a device in the /etc/fstab file" it should be made clear that the
mountpoint refers to the /etc/fstab-file, e.g. "then mount looks in the
/etc/fstab file firstly for a mountpoint and if not found then secondly
for a device". I did not understand the sentence until now and wondered,
what was meant by 'mountpoint'.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
