Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212D21DED4C
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016394; cv=none; b=Dupc1sJ4OkjldSwhaLuK/8ZTQJ8YqOqNy7WBI1Ee4ishDp7+jts5LZRtdtxQRjryRTNj9wu/NYiw7tqev9OYHA8MklV3H0VmrbFNSv/RTBYwAgGVHyJbGDhy7XJdAulnijQu85aBSZhxk6m8TqL2/UdztemM8f39h/5HtLp6e/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016394; c=relaxed/simple;
	bh=bdgU4Xm0DnA3hHGjgX9phlgzuC2Q32BXMHsDqOmhIaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uHZ2A3+3emWwrfOeoHqALdF5IJMz08+XioQmImxNK6tQxf86+WMVBYnyNJbWs/V/qUWGDZijp2oGW4O5feHosqHpCpbLIj3UQMNFxNlYCZ/+Cqmv0A30IXE/fcobtx67AkkvKIYmOiIXDDHQZT5qB4LHgD5XdGJnKT9nJcQLWkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org; spf=pass smtp.mailfrom=maowtm.org; dkim=pass (2048-bit key) header.d=maowtm.org header.i=@maowtm.org header.b=ZotiQfi2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NIYykVEo; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maowtm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maowtm.org header.i=@maowtm.org header.b="ZotiQfi2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NIYykVEo"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 043071D000AC;
	Sat, 29 Aug 2026 11:13:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 29 Aug 2026 11:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maowtm.org; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1788016390; x=1788102790; bh=WD
	CAeep9NZi70YQxEcR/QjFLUY8exUvTz4djj99X+zI=; b=ZotiQfi2qUCII4NpYC
	2jWcKpNmIYo0UlLSz9E88TMHCqX3fZuu6JZB4cTdL9xsJMIWmMcw6XlzymXJd1N/
	T8DrH+mLrwocIEur3S9O6cfvaZZQaQvF2Uxe+R+o7jrdiF8FIdwQBnYGeyWCHFrR
	GiQyZlES7HTuwJyiJpLT3QQSmRV8m6FWmDry12oh4VniLqID8BxhSd73FVOx90ec
	a2xFvrsOjg0R6+ilcz+gF1zDPJxZE7cq/TyIjNdCMyGXEvR0PQRI5pi4pdIvfDoy
	hTWg9s09jAXZ9Cz58K019+Emd/pBzFf6BgJiUdU/ohlaXeVvzGzFTQb34pgLK4UL
	pqLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1788016390; x=1788102790; bh=WDCAeep9NZi70YQxEcR/QjFLUY8e
	xUvTz4djj99X+zI=; b=NIYykVEoAkbklH9nxTYO0sTO6cvcKp4M992q1v+hz1PV
	6jHaKFvstfiGVV03HlP3KX0YbeGjSzORbYodrIC5AFppiN6FmXnLjL9SEk+Mzzjl
	oeBgAVV/kJ2jPeCIxHitX1QQUUd37mmi99ZkfbsGYjM6Whc9Tw7BnKcQ4VM7dxwc
	hCRMeTKva1sZeO6QHMG/y2NMgWrlwD/MUtnksyzN8TkUvDYCc4M1mPb49lD8eAsG
	hjVxXFnDeBdpYur1DT3kkOMKMyavvANx6fs/s+UCvzuOXB0xW5F249G3J/nebjo8
	NlTsEMbUG4ws1+JbfkD6emF8M1Uj2GKcl2HigMaE8Q==
X-ME-Sender: <xms:BveSanHKmHZU7iYkiH5CXRFgxx8b2uXnRqEVHpQvHJJqVUz6N2YB2A>
    <xme:BveSarOeSH7E-XZnRTRZQGT0Jc2n7wP90cZ0xEqVTALb0hlb0ZiCIm4h4JrcDmba9
    pfSIT3QgGIRG_K7OlDEyDcQMJDgikj01HTzVyKogWpvDUrOFvyVNrQ>
X-ME-Received: <xmr:BveSahf3li1lbmFt5NZtRZ2yTkpLd0l6OOQqaeqklS1vVlORnGUA1iUmaG5oClKMJbxBtA1VokLkkoywUqdUKA6l0afIfOlRQVE5nAn-LVYeQmRUnkLoZqA>
X-ME-Proxy-Cause: dmFkZTFOVPwSLTBq+aoLuSvWpip1TTa4APUNs/+lIAdterK1XCbDlGMucwm9duVbpThhOl
    8GqEkLh3K27v/5NreBaYUopLIpMTNqh63NqUp1R/kWlabzLpObOv6tELa/tk7nipanXfXt
    YgNaBJSNZhOQ1jFPzcbtT1jMxeSk7uXbZ/e4riLG2VMHTvIwyUHcbtUehSxldPXSnTjRC8
    DoSULoEmdvWLruDd1G8kCE/Lr0LcwWs4KTtZ6rIs/ojV+ZEUys9Rbc8ArYc8u98UOG/VHv
    61VyBMMT/FKjb6tvEyqDp7YJBhtKcKlAkkLPWBXpUH4s3SSazTwenh5y7iG3NlbJpJWwEQ
    MfuxJLnetSTLuzQKQE/idB0mN8xexXybpePim8AOaD6Zcp7UNk7PWGUl5UArI2zkcf+hkH
    8ar8dzgNfqp8589PKbyolaw1A1EA+L5W20jUnZUnYYMopgphW5NKX/Y3kZmR90u2TnE/YK
    lYu3wWc9OU5zfnB/+zjbgsgWkmAw4Kp1BtHJ/ELbhMg85lzALB/kDDff/Ydk+ZtxunubrK
    Jltcax3hAbuq2zQaFayUvqpqaTTUdhn8tfO5QWp3yPgjdIkN4Fa03CP2oG1l05jmKBWH55
    7iYYxsJsj8+OMMwEGJHWpdszzV0QwG2PJ4W5UHibOBwLZ2MgDukincv+Z6OQ
X-ME-Proxy: <xmx:BveSagsJG0zGQo2rU2y6h8DzPYpsWahOMxArLjdq7onlYimH8_3luw>
    <xmx:BveSaql43MbV3S4mF6NkSDooGhFqTTv-ULa10-LYzVbrwi1_1lwTng>
    <xmx:BveSaqyPD47fRfo8PsDyCHjx3MazIhvkt4-6jtKgfs4jr7_1Rij79g>
    <xmx:BveSakP8fWi9UGsCpLL6BHPQJiLSIChkmBgdALQqIos7CUNl4NTnmQ>
    <xmx:BveSaqLQaZrtuqM27cKSLnmkH4mkvMp_nt_Igva0kxS5B1vG52qCMTLX>
Feedback-ID: i580e4893:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Aug 2026 11:13:09 -0400 (EDT)
From: Tingmao Wang <m@maowtm.org>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Tingmao Wang <m@maowtm.org>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2] landlock.7, landlock_*.2: Document LANDLOCK_ADD_RULE_QUIET
Date: Sat, 29 Aug 2026 16:13:03 +0100
Message-ID: <20260829151304.101952-1-m@maowtm.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LANDLOCK_ADD_RULE_QUIET is a new feature introduced in Landlock ABI
version 10, merged in kernel v7.2 [1].  This patch copies relevant
kernel documentation into man-pages.

Link: <https://patch.msgid.link/cover.1781228815.git.m@maowtm.org/> [1]
Signed-off-by: Tingmao Wang <m@maowtm.org>
---

Changes in v2:
- Fix missing .RE, and fix EINVAL label being incorrectly formatted
- Fix missed API bump in the example program (abi = MIN(abi, 10);)

Hi,

For context, I'm the author of the quiet flag feature and this is my
first man-pages patch.  @Günther or @Mickaël, can one of you do a quick review?

All text in this patch is copied from the kernel source except this
bit:
    .TP
    .B EINVAL
    .I flags
    is not 0 or one of the allowed values.

(the kernel says "%EINVAL: @flags is not valid", I decided to make it
more precise)

 man/man2/landlock_add_rule.2       | 48 ++++++++++++++++++++++++++++--
 man/man2/landlock_create_ruleset.2 | 48 ++++++++++++++++++++++++++++++
 man/man7/landlock.7                | 29 +++++++++++++++++-
 3 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index fe01a98d9..c848c9b4b 100644
--- a/man/man2/landlock_add_rule.2
+++ b/man/man2/landlock_add_rule.2
@@ -120,7 +120,44 @@ .SH DESCRIPTION
 and it will automatically translate to binding on the related port range.
 .P
 .I flags
-must be 0.
+can either be 0 or contain:
+.TP
+.BR LANDLOCK_ADD_RULE_QUIET "  (since Landlock ABI version 10)"
+Together with the
+.I quiet_*
+fields in
+.IR "struct landlock_ruleset_attr" ,
+this flag controls whether Landlock will log audit messages when
+access to the objects covered by this rule is denied by this layer.
+.IP
+If logging is enabled, when Landlock denies an access,
+it will suppress the log if all of the following are true:
+.RS
+.IP \[bu] 3
+this layer is the innermost layer that denied the access;
+.IP \[bu]
+all accesses denied by this layer are part of the
+.I quiet_*
+fields in the related
+.IR "struct landlock_ruleset_attr" ;
+.IP \[bu]
+the object (or one of its parents, for filesystem rules) is
+marked as "quiet" via
+.BR LANDLOCK_ADD_RULE_QUIET .
+.RE
+.IP
+Because logging is only suppressed by a layer if the layer denies
+access,
+a sandboxed program cannot use this flag to "hide" access denials,
+without denying itself the access in the first place.
+.IP
+The effect of this flag does not depend on the value of
+.I allowed_access
+in the passed in
+.IR rule_attr .
+When this flag is present, the caller is also allowed to pass in an
+empty
+.IR allowed_access .
 .SH RETURN VALUE
 On success,
 .BR landlock_add_rule ()
@@ -159,7 +196,7 @@ .SH ERRORS
 .TP
 .B EINVAL
 .I flags
-is not 0.
+is not 0 or one of the allowed values.
 .TP
 .B EINVAL
 The rule accesses are inconsistent (i.e.,
@@ -181,10 +218,15 @@ .SH ERRORS
 .IR \%struct\~landlock_net_port_attr ,
 the port number is greater than 65535.
 .TP
+.B EINVAL
+.B LANDLOCK_ADD_RULE_QUIET
+is passed but the ruleset has no quiet access bits set for the
+corresponding rule type.
+.TP
 .B ENOMSG
 Empty accesses (i.e.,
 .I rule_attr\->allowed_access
-is 0).
+is 0) and no flags.
 .TP
 .B EOPNOTSUPP
 Landlock is supported by the kernel but disabled at boot time.
diff --git a/man/man2/landlock_create_ruleset.2 b/man/man2/landlock_create_ruleset.2
index 2a33fa4b5..8611e3aba 100644
--- a/man/man2/landlock_create_ruleset.2
+++ b/man/man2/landlock_create_ruleset.2
@@ -45,6 +45,9 @@ .SH DESCRIPTION
     __u64 handled_access_fs;
     __u64 handled_access_net;
     __u64 scoped;
+    __u64 quiet_access_fs;
+    __u64 quiet_access_net;
+    __u64 quiet_scoped;
 };
 .EE
 .in
@@ -70,6 +73,17 @@ .SH DESCRIPTION
 in
 .BR landlock (7)).
 .IP
+.I quiet_access_fs
+is a bitmask of filesystem actions which should not be logged if
+per-object quiet flag is set.
+.IP
+.I quiet_access_net
+is a bitmask of network actions which should not be logged if
+per-object quiet flag is set.
+.IP
+.I quiet_scoped
+is a bitmask of scoped actions which should not be logged.
+.IP
 This structure defines a set of
 .IR "handled access rights" ,
 a set of actions on different object types,
@@ -100,6 +114,29 @@ .SH DESCRIPTION
 a wide range or all access rights that they know about at build time
 (and that they have tested with a kernel that supported them all).
 .IP
+.I quiet_access_fs
+and
+.I quiet_access_net
+are bitmasks of actions for which a denial by this layer will not
+trigger a log if the corresponding object (or its children, for
+filesystem rules) is marked with the "quiet" bit via
+.BR LANDLOCK_ADD_RULE_QUIET ,
+even if logging would normally take place per
+.BR landlock_restrict_self (2)
+flags.
+.I quiet_scoped
+is similar, except that it does not require marking any objects as quiet
+-
+if the ruleset is created with any bits set in
+.IR quiet_scoped ,
+then denial
+of such scoped resources will not trigger any log.
+These 3 fields are available since Landlock ABI version 10
+(see
+.B Quiet rule flag
+in
+.BR landlock (7)).
+.IP
 This structure can grow in future Landlock versions.
 .P
 .I size
@@ -204,6 +241,17 @@ .SH ERRORS
 or
 .BR LANDLOCK_CREATE_RULESET_ERRATA .
 .TP
+.B EINVAL
+.IR quiet_access_fs ,
+.IR quiet_access_net ,
+or
+.I quiet_scoped
+is not a subset of the corresponding
+.IR handled_access_fs ,
+.IR handled_access_net ,
+or
+.IR scoped .
+.TP
 .B ENOMSG
 Empty accesses (i.e.,
 .I attr
diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
index 880dd5058..402e35cbe 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -456,6 +456,31 @@ .SS Truncating files
 It is also possible to pass such file descriptors between processes,
 keeping their Landlock properties,
 even when these processes do not have an enforced Landlock ruleset.
+.SS Quiet rule flag
+Starting with the Landlock ABI version 10,
+it is possible to selectively suppress logs for specific denied
+accesses on a per-object basis with the
+.B LANDLOCK_ADD_RULE_QUIET
+flag of
+.BR landlock_add_rule (2),
+in combination with the
+.B quiet_access_fs
+and
+.B quiet_access_net
+fields
+of
+.IR "struct landlock_ruleset_attr" .
+It is also now possible to suppress
+logs for scope accesses via the
+.B quiet_scoped
+field of
+.IR "struct landlock_ruleset_attr" .
+The object is marked as quiet within a ruleset when at least one
+.BR landlock_add_rule (2)
+call is made for it with the
+.B LANDLOCK_ADD_RULE_QUIET
+flag, additional add-rule calls for the same object without this flag
+do not clear it.
 .SH VERSIONS
 Landlock was introduced in Linux 5.13.
 .P
@@ -500,6 +525,8 @@ .SH VERSIONS
 8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
 _	_	_
 9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
+_	_	_
+10	7.2	LANDLOCK_ADD_RULE_QUIET
 .TE
 .P
 Users should use the Landlock ABI version rather than the kernel version
@@ -622,7 +649,7 @@ .SH EXAMPLES
     perror("Unable to use Landlock");
     return;  /* Graceful fallback: Do nothing.  */
 }
-abi = MIN(abi, 9);
+abi = MIN(abi, 10);
 \&
 /* Only use the available rights in the ruleset.  */
 attr.handled_access_fs &= landlock_fs_access_rights[abi \- 1];
-- 
2.55.0

