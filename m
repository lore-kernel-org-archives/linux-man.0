Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DC7C433E6
	for <linux-man@archiver.kernel.org>; Thu, 28 Jan 2021 15:28:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79AC560235
	for <linux-man@archiver.kernel.org>; Thu, 28 Jan 2021 15:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhA1P2E (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 28 Jan 2021 10:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhA1P2D (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 28 Jan 2021 10:28:03 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599BBC061573;
        Thu, 28 Jan 2021 07:27:23 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id m13so5793384wro.12;
        Thu, 28 Jan 2021 07:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1rM7x7Z3e4bwJpOTsrzzOkgiEX275b2J37LkzY/JUqQ=;
        b=MfsX5nY/cicsRs4UYZ7o2Hk+ZLMz+A5Pr+uNDNVUwlCJAjCIKsBnnT40cgbgEQCTgQ
         sBDWlHWddY3D5wilIRVM3R/7hOD+P6lphx+hj9TZhHZJS8ZGla30NkonDrjxXTd8Kt6a
         s+EGP2IlZmszugpvn1QOHkb0juqTBkGi/xEvQHR90NSXnHFPXr2sbo2spWRznZLZSrJ+
         Frv3LIDtjQuvS7w3UPglpu0V7pk3RAV/TqR86n4WRCiKP4EIhaDe0IWWS1YylE1gvtZF
         Uo2s6bUJ85qgVdTaAWcUzohpj2z60GjMkxfEIeQ7oAWfCw2zLczfqpMnTWiUNe7xarwz
         12+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1rM7x7Z3e4bwJpOTsrzzOkgiEX275b2J37LkzY/JUqQ=;
        b=C/XkwUPCw770cip9/2Iix2M5IoIDvTRGudVJYK5QxDx/SoKNdrtoKAuKChhzU8JsTv
         L2hOHEhyL3WoEbmMhsACCTB7D+abq3sF6hzC1Pifmsw766i1j4aS44CaaMP+OTGRVdL9
         jU7EFgfvPI3ouo3XVA4Rlze0GvcS3h7JDYwsqCg72oZKqDfKRWr+OJkGNkUlFilgFYoB
         oaXwzbU2CVeww6qfGPlmQ1Jl1gOXbBSChupBPl2SrPStSGlX6O46ZSqp9kuZ3GiyU1Pl
         mNHecB/TxsGp0i4nzDbTgTefWacB4yExwFfwI790eVovonv3qYBuASerOwTMX3BvD/y/
         0SHQ==
X-Gm-Message-State: AOAM531DF5ZhBUihdfgD8NwK8tNzEIYowE4TIphi/WBYzI6Cw2hSx8Ev
        Kf9J5t8sHIsGy7oaBIzXuoM=
X-Google-Smtp-Source: ABdhPJx36tlgAFmVxtgYCGJVyAtGmCG/aj6Ssn0kCUsdibLL+Qz5Q+uChAZ8jaBeZKjIPYqRCV8wVQ==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr16729400wrd.329.1611847642133;
        Thu, 28 Jan 2021 07:27:22 -0800 (PST)
Received: from localhost.localdomain ([170.253.49.0])
        by smtp.googlemail.com with ESMTPSA id c78sm6292848wme.42.2021.01.28.07.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 07:27:21 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        linux-man@vger.kernel.org, "Dmitry V . Levin" <ldv@altlinux.org>,
        netdev@vger.kernel.org, Alejandro Colomar <alx.manpages@gmail.com>
Subject: [PATCH 1/2] netdevice.7: Update documentation for SIOCGIFADDR SIOCSIFADDR SIOCDIFADDR
Date:   Thu, 28 Jan 2021 16:24:30 +0100
Message-Id: <20210128152430.314458-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Pali Rohár <pali@kernel.org>

Unlike SIOCGIFADDR and SIOCSIFADDR which are supported by many protocol
families, SIOCDIFADDR is supported by AF_INET6 and AF_APPLETALK only.

Unlike other protocols, AF_INET6 uses struct in6_ifreq.

Cc: Dmitry V. Levin <ldv@altlinux.org>
Cc: <netdev@vger.kernel.org>
Signed-off-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man7/netdevice.7 | 64 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/man7/netdevice.7 b/man7/netdevice.7
index 15930807c..bdc2d1922 100644
--- a/man7/netdevice.7
+++ b/man7/netdevice.7
@@ -56,9 +56,27 @@ struct ifreq {
 .EE
 .in
 .PP
+.B AF_INET6
+is an exception.
+It passes an
+.I in6_ifreq
+structure:
+.PP
+.in +4n
+.EX
+struct in6_ifreq {
+    struct in6_addr     ifr6_addr;
+    u32                 ifr6_prefixlen;
+    int                 ifr6_ifindex; /* Interface index */
+};
+.EE
+.in
+.PP
 Normally, the user specifies which device to affect by setting
 .I ifr_name
-to the name of the interface.
+to the name of the interface or
+.I ifr6_ifindex
+to the index of the interface.
 All other members of the structure may
 share memory.
 .SS Ioctls
@@ -143,13 +161,33 @@ IFF_ISATAP:Interface is RFC4214 ISATAP interface.
 .PP
 Setting the extended (private) interface flags is a privileged operation.
 .TP
-.BR SIOCGIFADDR ", " SIOCSIFADDR
-Get or set the address of the device using
-.IR ifr_addr .
-Setting the interface address is a privileged operation.
-For compatibility, only
+.BR SIOCGIFADDR ", " SIOCSIFADDR ", " SIOCDIFADDR
+Get, set, or delete the address of the device using
+.IR ifr_addr ,
+or
+.I ifr6_addr
+with
+.IR ifr6_prefixlen .
+Setting or deleting the interface address is a privileged operation.
+For compatibility,
+.B SIOCGIFADDR
+returns only
 .B AF_INET
-addresses are accepted or returned.
+addresses,
+.B SIOCSIFADDR
+accepts
+.B AF_INET
+and
+.B AF_INET6
+addresses, and
+.B SIOCDIFADDR
+deletes only
+.B AF_INET6
+addresses.
+A
+.B AF_INET
+address can be deleted by setting it to zero via
+.BR SIOCSIFADDR .
 .TP
 .BR SIOCGIFDSTADDR ", " SIOCSIFDSTADDR
 Get or set the destination address of a point-to-point device using
@@ -351,10 +389,18 @@ The names of interfaces with no addresses or that don't have the
 flag set can be found via
 .IR /proc/net/dev .
 .PP
-Local IPv6 IP addresses can be found via
-.I /proc/net
+.B AF_INET6
+IPv6 addresses can be read from
+.I /proc/net/if_inet6
+file or via
+.BR rtnetlink (7).
+Adding a new or deleting an existing IPv6 address can be done via
+.BR SIOCSIFADDR " / " SIOCDIFADDR
 or via
 .BR rtnetlink (7).
+Retrieving or changing destination IPv6 addresses of a point-to-point
+interface is possible only via
+.BR rtnetlink (7).
 .SH BUGS
 glibc 2.1 is missing the
 .I ifr_newname
-- 
2.30.0

