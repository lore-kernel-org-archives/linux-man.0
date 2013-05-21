From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: iso_8859-2.7.gz 90: warning: can't find special character `shc'
Date: Tue, 21 May 2013 22:59:58 +0200
Message-ID: <20130521205958.GB4614@glenfiddich.mraw.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Oct    Dec     Hex     Char            Description
[..]
255    173     AD      <AD>\[shc]      SOFT HYPHEN

On top of groff warning:
usr/share/man/man7/iso_8859-2.7.gz 90: warning: can't find special character `shc'

While other char are ok, <AD> doesn't display anything on my computer,
\(hy may be used instead, but I understand it's not really the point of that
manpage.


-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
