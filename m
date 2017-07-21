From: rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org
Subject: Possible clarification in man pages for i2cget, i2cset (i2c-tools
 package)
Date: Fri, 21 Jul 2017 08:31:33 -0400
Message-ID: <20170721083133.Horde.ccOniaKYyb7HDLXYIHKarIm@crashcourse.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


   Not sure if this represents a trivial error appropriate for this  
list, but in
the current man page for "i2cget" (and "i2cset" as well), the valid values for
an I2C device address are given as 0x03->0x77.

   Actually, I2C device addresses of the form 0x00001XX (0x04->0x07)  
are reserved
to identify high-speed master code:

   https://www.i2c-bus.org/highspeed/

so *regular* I2C device addresses fall in the range 0x08->0x77. I  
don't know if
it's worth clarifying that pedantic detail.

rday

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
