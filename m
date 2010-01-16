From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: rtnetlink(3) undeclared variable in example
Date: Sat, 16 Jan 2010 18:29:07 +0100
Message-ID: <cfd18e0f1001160929i4243f219k8c3c6d017a0094d9@mail.gmail.com>
References: <E1NVmKG-0000C6-I5@whorl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1NVmKG-0000C6-I5@whorl>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: eddy-4vTceeIZeJ0AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Edward,

On Fri, Jan 15, 2010 at 2:34 PM, Edward Welbourne <eddy-4vTceeIZeJ0AvxtiuMwx3w@public.gmane.org> wrot=
e:
> In man 3 rtnetlink, the example code includes the lines:
>
> =A0 =A0 =A0 =A0 =A0 rta =3D (struct rtattr *)(((char *) &req) +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 NLMSG_ALIGN(n->nlmsg_len));
>
> in which the variable "n" is nowhere declared. =A0It seems likely tha=
t
> NLMSG_ALIGN(req.nh.nlmsg_len) was intended, albeit I am so deeply
> ignorant of relevant systems that I am learning about them by reading
> man pages, so I may easilly be wrong ...

My guess is that your interpretation is correct, and indeed there are
a few other pieces that look to need similar fixes. I've applied the
patch below, and CCed Andi, who may be offer further
input/confirmation.

> I am also acutely aware of the bug already noted on the man page, but
> you clearly already know about that one !

Yup.

Cheers,

Michael

--- a/man3/rtnetlink.3
+++ b/man3/rtnetlink.3
@@ -84,6 +84,9 @@ This manual page is incomplete.

 Creating a rtnetlink message to set the MTU of a device:
 .nf
+    #include <linux/rtnetlink.h>
+
+    ...

     struct {
         struct nlmsghdr  nh;
@@ -99,18 +102,18 @@ Creating a rtnetlink message to set the MTU of a d=
evice:
     memset(&req, 0, sizeof(req));
     req.nh.nlmsg_len =3D NLMSG_LENGTH(sizeof(struct ifinfomsg));
     req.nh.nlmsg_flags =3D NLM_F_REQUEST;
-    req.nh.nlmsg_type =3D RTML_NEWLINK;
+    req.nh.nlmsg_type =3D RTM_NEWLINK;
     req.if.ifi_family =3D AF_UNSPEC;
     req.if.ifi_index =3D INTERFACE_INDEX;
     req.if.ifi_change =3D 0xffffffff; /* ???*/
     rta =3D (struct rtattr *)(((char *) &req) +
-                                  NLMSG_ALIGN(n\->nlmsg_len));
+                                  NLMSG_ALIGN(req.nh.nlmsg_len));
     rta\->rta_type =3D IFLA_MTU;
     rta\->rta_len =3D sizeof(unsigned int);
-    req.n.nlmsg_len =3D NLMSG_ALIGN(req.n.nlmsg_len) +
+    req.n.nlmsg_len =3D NLMSG_ALIGN(req.nh.nlmsg_len) +
                                   RTA_LENGTH(sizeof(mtu));
     memcpy(RTA_DATA(rta), &mtu, sizeof(mtu));
-    send(rtnetlink_sk, &req, req.n.nlmsg_len);
+    send(rtnetlink_sk, &req, req.nh.nlmsg_len);
 .fi
 .SH "SEE ALSO"
 .BR netlink (3),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
