From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@purestorage.com>
Subject: open(2) manpage and O_NONBLOCK
Date: Mon, 21 Mar 2016 13:23:47 -0700
Message-ID: <20160321202347.GG1612@cork>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

In open(2), we seem to promise more than the kernel can deliver:
       O_NONBLOCK or O_NDELAY
               When possible, the file is opened in nonblocking mode.
	       Neither the open() nor any subsequent operations on the
	       file descriptor which is returned  will  cause  the
	       calling process to wait.

Clearly you can question whether every last device driver correctly
supports O_NONBLOCK in its open routine.  But even if that was the case=
,
we still cannot guarantee nonblocking behaviour for open().
get_empty_filp() has to be called for every open() and contains a
blocking memory allocation:
        f =3D kmem_cache_zalloc(filp_cachep, GFP_KERNEL);

As such I would propose to change the documentation and keep the code.
The open() itself may very well block, but subsequent operations should
not.

J=F6rn

--
Why do musicians compose symphonies and poets write poems?
They do it because life wouldn't have any meaning for them if they didn=
't.
That's why I draw cartoons.  It's my life.
-- Charles Shultz
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
