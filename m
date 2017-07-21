From: rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org
Subject: "See Also" references to all i2c-tools programs seem to need
 updating
Date: Fri, 21 Jul 2017 08:59:37 -0400
Message-ID: <20170721085937.Horde.Rgdc7qw4kZ7Xv_iWiS6Jf8Z@crashcourse.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

   Just noticed that the "See Also" references to all of the programs in the
i2c-tools package could use some updating. Currently, i2c-tools (on Fedora,
at least) installs the utilities:

  * i2cset
  * i2cget
  * i2cdump
  * i2cdetect

which suggests that each of those man pages should refer to *all* of the
other three utilities.

   In addition, "man i2cset" currently has a "See Also" reference to
"isaset(8)", which seems a bit odd but maybe that's for historical purposes.

   Finally, "man i2cdetect" has a reference to "sensors-detect(8)", but
I'm not sure this is necessary since i2c-tools was extracted from the
sensors-detect package a while ago, so I don't think any of the I2C
tools need refer to sensors-detect any longer.

rday

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
