Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F02397E89
	for <linux-man@vger.kernel.org>; Tue,  1 Sep 2026 23:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306145; cv=none; b=ONPmlPLlnwlYVPKsXxvzAwTzq3KsaR3agkehc/3/sWwkKMBa56Mzs1r0BLhTRhmW2VwuvAY4mShKbtjKj3sKjeFq/J8YoPGS/Yq1QjUIONWhVnA2MHnssAygDL5H8NM6M1MZFC1W16bcfWUXEIQokwlv6Bw5V+a6T/RCMSf3OyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306145; c=relaxed/simple;
	bh=KmwC4P/eX4k7R9ZRAcj9m6ZGBkkgBff409vGzoYbM0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B2Q8v2dFkSnZR/7YpjmJvifMk/20vtQgXeOan80EmjjGaa6Mh49gaajDKpKvsO414M1MUEorOc5grFLdrxiqrstVs/VsNC1k9zyFBD16dyTNpqkRoR2Ig1N5MLcmXgc3bOKXUsDyDhrLH//hL9evI+S6MZmvpDS8eHLjGDxj6AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org; spf=pass smtp.mailfrom=maowtm.org; dkim=pass (2048-bit key) header.d=maowtm.org header.i=@maowtm.org header.b=OIlNjdnW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HqxUTTFV; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maowtm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maowtm.org header.i=@maowtm.org header.b="OIlNjdnW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HqxUTTFV"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 26E27EC01FF;
	Tue,  1 Sep 2026 19:42:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 01 Sep 2026 19:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maowtm.org; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1788306142; x=1788392542; bh=RK
	/yTJzQCZGV7eMaPaZfkfNBHZi34lb5w+Czl+AZI88=; b=OIlNjdnWaZqOC5NGRe
	J3gP0By/DRk88xNOGUEMS2JwAyUP5qwAF8ji6rrwqw/CYvFWu95ujAs0+dsCgBzN
	F0LV2Min5t0cOY0y8SsUbDgclNdNZLQQGR/FSki3k2yhcD+xOXPYYGkMKvsj9G4g
	0QTliUKR9oVhsSZbwJ2D3YCSvmbwrjhSVGgl8EJ0VNAJuL31BNm5E3Rr0AbRrPnN
	L/n+rXuBtCkW37CvEzFPPFzjfaMqDaWlq/tgAELQxiU1ndTu9HYZOGGCz1/o2yQg
	rwHaA4oN2H5ylZAiR85vUf17CoeCbVNUJP8EP6fHvPDBVyvlV6efwlJzcimJy7zH
	YCpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1788306142; x=1788392542; bh=RK/yTJzQCZGV7eMaPaZfkfNBHZi3
	4lb5w+Czl+AZI88=; b=HqxUTTFVRM/fXWEv6xOWwrf8D3qKmdpZgRVl7ea2Gm9M
	2232bl5AcKAZvEv5gBpZzjRzComkcOVlQpeUQaUyFnT81z622PYQ5hmnCAPm88Nb
	rVIAJiwN7e0lPzJfW71p3VBG6sahOoWgOdra3K1oJ9rDWaubdEDRA1nvd8H+pQAs
	OE58Xhwlwj3wVRvF6BXt0zTIoDTEvXxnDR9RafWksgqBz80MMVAQjz4jU5L74FRv
	DTuwOEaTIeAGcPhBbh0YiOFya+Qbtv13dzMXHdU419/sKTmDZQO6P56R7xmoTL0M
	m3T36BU0v9/hZ7KgOpop3vJw8qPzu4/NMqzOxNfr0A==
X-ME-Sender: <xms:3WKXauWfIaZbN0fpoVJHd3Qcm5h9cwd9rmmOYISdElXdNPQkA2D5lg>
    <xme:3WKXahe5QQonWQHee7zDLOmrmHWUAFzLBAWuF8u8urfei58R8R3ezSOap-yvGru6V
    SFVv9BKn_aLOAmTmQdjPlApMk6X3kbYIBmMMtRhtctdo2CQRgnCvwGi>
X-ME-Received: <xmr:3WKXaqsLjaAFuAslH9jGgUnmupsFapPkBeE-n0RNna_ySs4FixV74bT6ALYUfphj-LFFbK1Yz5si6qgpVhj0Yi73jhMxi15Mcz5OaLuMWXsWuT2nsfjpGEU>
X-ME-Proxy-Cause: dmFkZTFR823EtyNVLIJVbb6Veqil9QCjfKlbST7L/78hpOZUypqzS0NxqZs6UeE+hivKrb
    V4EsuPa1tBc/8eGb3WMzib0sqi3Hk3Y4T+guN2rPnrV+yxLLVNeGUyHRLTxUdqYcnCf9OC
    O3U4wD0boMPZQ+7jTmais401FFRmPgWq/fcZmHlAndf74X8r6uFtz5O6W6/DWbAKJx5Hu/
    T4sYN+0haxhk+krp/HUkCUdlaqEUzg3DGmX0AjhQJl2oxDGTwD+54XTUKnW5MCs+nonYjd
    sypij98v8LOE7K982vYCEYKiOq668XNeLiCLMHuXA6I7sf09k4PFQjA4bL+w434bc0MqoE
    VrYgArfwDNPtnvuNvImgcU/2UBz24Ck/W6fhTboI06zCELNJHwmtVZasumWmlydqVNdJYz
    p8YvMrtwUd/y9LeodM9Fpa1U2xYMwyrKE9YYW5lV1HPvxjTu75AoELvDsG8BfbEm7KRplx
    eG7bUGxlElRoJIn2EEH9jJErVPmC8YdI7tsaktYg8EbkKP0TgTELa1jXJUnDMj13H6i9V4
    szz6mnoR2rtGn0QsJL2ZF2JAH+j5wa85v3aIDk3W6j6ifWvDgxa3jwXDUFfJ06me1GaWRr
    l6nlrQvYlgMFFuJ5RJlstfhDP1C2L4TVaC0tItsxGV1zqjNRlhZdGpuK56MA
X-ME-Proxy: <xmx:3WKXag_EzqVL9t0NpkI4pKcEXOcmxsO8dXWFM1EBLnDdqEtW9qKJZQ>
    <xmx:3WKXal2xGFIIR0Y5nTGrBWLcu8ehfSzWzRPMV5juNe2la37S6Keu0Q>
    <xmx:3WKXalBslU9qEyrMUF9GmHmAVAHSogHIWRjClx7aSbRhvU15L3XDcA>
    <xmx:3WKXahdG6LFjbuhScfj3w-swFRy2vIHPZ7xnLqY01dH8EEBpZUrVmw>
    <xmx:3mKXaiaeJbTqs5xZCP9iZummJAha_U1DyxwfIVnY7pn56dqDC9xFZPHS>
Feedback-ID: i580e4893:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 19:42:20 -0400 (EDT)
From: Tingmao Wang <m@maowtm.org>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Tingmao Wang <m@maowtm.org>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v4] landlock.7, landlock_*.2: Document LANDLOCK_ADD_RULE_QUIET
Date: Wed,  2 Sep 2026 00:42:02 +0100
Message-ID: <20260901234202.1608520-1-m@maowtm.org>
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

Changes in v4:
Applied review suggestions:
- \em to parentheses
- can either be 0 or contain -> is a bit mask of the following optional flags
- .IR quiet_ *
- .IR \%struct\~landlock_ruleset_attr .
- Fix more semantic line breaks
- EINVAL flags "is not 0 or one of the allowed values" -> "is not valid"
- bitmask -> bit mask

Changes in v3:
- Fix out of bound array access in example caused by incrementing abi
  maximum but forgetting to also append the array.
- Semantic line breaks
- Add accidentally dropped lines:
    @quiet_access_fs, @quiet_access_net and @quiet_scoped must be a
    subset of @handled_access_fs, @handled_access_net and @scoped
    respectively.
  Thanks Günther!

Changes in v2:
- Fix missing .RE, and fix EINVAL label being incorrectly formatted
- Fix missed API bump in the example program (abi = MIN(abi, 10);)

For context, I'm the author of the quiet flag feature.

All text in this patch is copied from the kernel source except updates
requested in review of this patch.

 man/man2/landlock_add_rule.2       | 53 ++++++++++++++++++++++++--
 man/man2/landlock_create_ruleset.2 | 60 ++++++++++++++++++++++++++++++
 man/man7/landlock.7                | 34 ++++++++++++++++-
 3 files changed, 143 insertions(+), 4 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index fe01a98d9..94bc63068 100644
--- a/man/man2/landlock_add_rule.2
+++ b/man/man2/landlock_add_rule.2
@@ -120,7 +120,47 @@ .SH DESCRIPTION
 and it will automatically translate to binding on the related port range.
 .P
 .I flags
-must be 0.
+is a bit mask of the following optional flags:
+.TP
+.BR LANDLOCK_ADD_RULE_QUIET "  (since Landlock ABI version 10)"
+Together with the
+.IR quiet_ *
+fields in
+.IR \%struct\~landlock_ruleset_attr ,
+this flag controls whether Landlock will log audit messages when
+access to the objects covered by this rule is denied by this layer.
+.IP
+If logging is enabled,
+when Landlock denies an access,
+it will suppress the log if all of the following are true:
+.RS
+.IP \[bu] 3
+this layer is the innermost layer that denied the access;
+.IP \[bu]
+all accesses denied by this layer are part of the
+.IR quiet_ *
+fields in the related
+.IR \%struct\~landlock_ruleset_attr ;
+.IP \[bu]
+the object
+(or one of its parents, for filesystem rules)
+is marked as "quiet" via
+.BR LANDLOCK_ADD_RULE_QUIET .
+.RE
+.IP
+Because logging is only suppressed by a layer
+if the layer denies access,
+a sandboxed program cannot use this flag
+to "hide" access denials,
+without denying itself the access in the first place.
+.IP
+The effect of this flag does not depend on the value of
+.I allowed_access
+in the passed in
+.IR rule_attr .
+When this flag is present,
+the caller is also allowed to pass in an empty
+.IR allowed_access .
 .SH RETURN VALUE
 On success,
 .BR landlock_add_rule ()
@@ -159,7 +199,7 @@ .SH ERRORS
 .TP
 .B EINVAL
 .I flags
-is not 0.
+is not valid.
 .TP
 .B EINVAL
 The rule accesses are inconsistent (i.e.,
@@ -181,10 +221,17 @@ .SH ERRORS
 .IR \%struct\~landlock_net_port_attr ,
 the port number is greater than 65535.
 .TP
+.B EINVAL
+.B LANDLOCK_ADD_RULE_QUIET
+is passed
+but the ruleset has no quiet access bits set
+for the corresponding rule type.
+.TP
 .B ENOMSG
 Empty accesses (i.e.,
 .I rule_attr\->allowed_access
-is 0).
+is 0)
+and no flags.
 .TP
 .B EOPNOTSUPP
 Landlock is supported by the kernel but disabled at boot time.
diff --git a/man/man2/landlock_create_ruleset.2 b/man/man2/landlock_create_ruleset.2
index 2a33fa4b5..85df03668 100644
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
+is a bit mask of filesystem actions which should not be logged
+if the per-object quiet flag is set.
+.IP
+.I quiet_access_net
+is a bit mask of network actions which should not be logged
+if the per-object quiet flag is set.
+.IP
+.I quiet_scoped
+is a bit mask of scoped actions which should not be logged.
+.IP
 This structure defines a set of
 .IR "handled access rights" ,
 a set of actions on different object types,
@@ -100,6 +114,41 @@ .SH DESCRIPTION
 a wide range or all access rights that they know about at build time
 (and that they have tested with a kernel that supported them all).
 .IP
+.I quiet_access_fs
+and
+.I quiet_access_net
+are bit masks of actions for which a denial by this layer
+will not trigger a log
+if the corresponding object
+(or its children, for filesystem rules)
+is marked with the "quiet" bit via
+.BR LANDLOCK_ADD_RULE_QUIET ,
+even if logging would normally take place per
+.BR landlock_restrict_self (2)
+flags.
+.I quiet_scoped
+is similar,
+except that it does not require marking any objects as quiet
+(if the ruleset is created with any bits set in
+.IR quiet_scoped ,
+then denial of such scoped resources will not trigger any log).
+These 3 fields are available since Landlock ABI version 10
+(see
+.B Quiet rule flag
+in
+.BR landlock (7)).
+.IP
+.IR quiet_access_fs ,
+.I quiet_access_net
+and
+.I quiet_scoped
+must be a subset of
+.IR handled_access_fs ,
+.I handled_access_net
+and
+.I scoped
+respectively.
+.IP
 This structure can grow in future Landlock versions.
 .P
 .I size
@@ -204,6 +253,17 @@ .SH ERRORS
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
index 880dd5058..ad63826da 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -456,6 +456,35 @@ .SS Truncating files
 It is also possible to pass such file descriptors between processes,
 keeping their Landlock properties,
 even when these processes do not have an enforced Landlock ruleset.
+.SS Quiet rule flag
+Starting with the Landlock ABI version 10,
+it is possible to selectively suppress logs
+for specific denied accesses
+on a per-object basis with the
+.B LANDLOCK_ADD_RULE_QUIET
+flag of
+.BR landlock_add_rule (2),
+in combination with the
+.B quiet_access_fs
+and
+.B quiet_access_net
+fields
+of
+.IR \%struct\~landlock_ruleset_attr .
+It is also now possible to suppress logs
+for scope accesses via the
+.B quiet_scoped
+field of
+.IR \%struct\~landlock_ruleset_attr .
+The object is marked as quiet within a ruleset
+when at least one
+.BR landlock_add_rule (2)
+call is made for it with the
+.B LANDLOCK_ADD_RULE_QUIET
+flag,
+additional add-rule calls
+for the same object without this flag
+do not clear it.
 .SH VERSIONS
 Landlock was introduced in Linux 5.13.
 .P
@@ -500,6 +529,8 @@ .SH VERSIONS
 8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
 _	_	_
 9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
+_	_	_
+10	7.2	LANDLOCK_ADD_RULE_QUIET
 .TE
 .P
 Users should use the Landlock ABI version rather than the kernel version
@@ -610,6 +641,7 @@ .SH EXAMPLES
     (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v7: same
     (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v8: same
     (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v9: add "resolve_unix"
+    (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v10: same
 };
 \&
 int abi = landlock_create_ruleset(NULL, 0,
@@ -622,7 +654,7 @@ .SH EXAMPLES
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
