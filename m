From: Adrian Dabrowski <atrox-qE3U7d0pukyEhLc4KmoMIOTv7YV0F9Eg@public.gmane.org>
Subject: getifaddrs()
Date: Thu, 05 Jul 2012 23:33:06 +0200
Message-ID: <4FF60812.70408@seclab.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Version: manpages-dev 3.27-1ubuntu2


The example program source produces a Seg-Fault, when a device does not 
have an ifa->ifa_addr. (e.g. openvpn-tunnels, probably others (dialup?))


ORIGINAL:
            for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
                family = ifa->ifa_addr->sa_family;


POSSIBLE FIX:
            for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
		if (ifa->ifa_addr != NULL)
                		family = ifa->ifa_addr->sa_family;
		else
			family = -1;


Also it is not documented, that  struct sockaddr *ifa_addr  might be NULL.


best wishes and keep up the good work,
Adrian Dabrowski
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
