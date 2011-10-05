From: Guillem Jover <guillem-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Updates to information about man pages from other Debian packages
Date: Wed, 5 Oct 2011 07:41:13 +0200
Message-ID: <20111005054109.GA25122@gaara.hadrons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

The information about man pages from other packages on Debian-based
systems on [0] could see some updates:

 * Instead of using the available db (dpkg -p), recommend using the
   status db (the installed packages) with something like this instead:

   $ dpkg-query -f '${Maintainer}\n' -W mount

 * The upstream maintainer is usually found in the copyright file:

   /usr/share/doc/<pkgname>/copyright

   although some times only the copyright holders are found there,
   otherwise the second best candidate might be the upstream
   changelog, found at:

   /usr/share/doc/<pkgname>/changelog.gz

regards,
guillem

[0] <http://man7.org/linux/man-pages/man_pages_other.html>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
