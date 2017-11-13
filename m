From: Ralph Corderoy <ralph-LZ+9dIjwmAmSaWcfd5glvw@public.gmane.org>
Subject: Mid-Sentence Exclamation Mark Has Large Gap.
Date: Mon, 13 Nov 2017 12:06:02 +0000
Message-ID: <20171113120602.7DBD02040B@orac.inputplus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Arch Linux's man-pages 4.13-1 has ex(1p) that formats poorly because
end-of-sentence characters aren't being followed by the zero-width
escape, `\&', to avoid the end-of-sentence spacing that follows.

    $ zcat /usr/share/man/man1/ex.1p.gz | grep -B2 'which must'
    except for the
    .BR !
    argument, which must follow the command name without intervening
    $
    $ curl -sS http://man7.org/linux/man-pages/man1/ex.1p.html |
    > grep 'which must'
	   &lt;blank&gt;-sensitive, except for the <b>!  </b>argument, which must follow the
    $

The same probably applies to other characters, e.g. `?', and man pages.

-- 
Cheers, Ralph.
https://plus.google.com/+RalphCorderoy
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
