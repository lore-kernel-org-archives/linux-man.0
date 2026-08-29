Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A935975
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025927; cv=none; b=EbSIQQ9UIGCyvzWHACgm/G0QzpuEcxVhW+4RsyhVAC2uwubSGlJOfi79U+u4V69wamqT1YjzweqzsxQNyXYaXMJ5wSDW4os82rfs1PFDFlsHHmqUbkAJOViO0pOhp20QKpkD75rb86AvUmqaFzGnSym+KGZy0hb4xOwRxPstiVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025927; c=relaxed/simple;
	bh=AavKVzRTSnHg2HJCr75ccBxbZhh+A3IKUMZdOh4oi3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vEZIlQwZAOEYJcQgQrlsyuvWLQc5iH2qZUZE7MXcYqPJICPFJqsCwH3c1G1EB0MjTQxOYgIMW7GUrR0oaKVTe9Osirx+iK5NJSrNE1WCMGdbMUkeqt2gNgKCJLyjwaPX5a4D8DtBJsfyKLUWKWnkWp9NeHT8cpzNc2PbH/Wpar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org; spf=pass smtp.mailfrom=maowtm.org; dkim=pass (2048-bit key) header.d=maowtm.org header.i=@maowtm.org header.b=Jq6NH1pa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gA/FSo4R; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maowtm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maowtm.org header.i=@maowtm.org header.b="Jq6NH1pa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gA/FSo4R"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B074C7A0097;
	Sat, 29 Aug 2026 13:52:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 29 Aug 2026 13:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maowtm.org; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1788025924; x=1788112324; bh=9P
	xXvPSsgC65Kb7zdQ9VaahiU3fm6nPv7fJEy21b4F4=; b=Jq6NH1panK59HdSJMp
	nYH6GgKO3edll4bOKceC3IjC4Ttx4NFDnz4gcqSX5UPqqRaE4ltZPGEMOwAxe3JW
	zGFF3tjSiB529DUiQIbxyRu5QFEd9bZs3xS71+WRLFKrSISmd/rUBzB8HgzssLlG
	ojD4CSp+ysJtTnuBxbRoEtD5WdnnmqitYTmXvBT0q6DiygKSf9BemArezZ4tShQA
	ParzlYqqNJCBFdpwfoFiQlisgMth94g/mLgZ8exf6yrqmlL7ojHyQVn0YGHQfCJ6
	9GHQsnBFNXQC/01Yaagi0y/MZS97Nv6bxi6kgdbteXi/B/riLKD4VXg8jHnwASLz
	FIww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1788025924; x=1788112324; bh=9PxXvPSsgC65Kb7zdQ9VaahiU3fm
	6nPv7fJEy21b4F4=; b=gA/FSo4RhiSDLhX8WeOkG4cHlaftrt2PlggV2SWBMb4y
	pdQeu5W+O206D8BVBIqwOS1CL0cS1WRPLnXiUa1o6kcJqkoaCxi5xKT2Af+OOUpV
	6l1rlpYlpUFUjou+syj0hrKP1vE45e3t0C6fhgXCQ4qkB676YoDrufI55o73eqed
	5dEE2qV5c8iOFy4YSxY/uuOGM1/0y9cavGKSzrqUDkwGAGVd6Xw/ymlv9Bcs5yAV
	6CaNsB8y+T9w/zyYvt0TMkOw5opfHZBtBZO+L9gF7FUF7NwMIZgc651le+MlXnCd
	ZQu+rBTwQEMKsrzCLgwHYr2AbZKLt75gfDCL9JVS1Q==
X-ME-Sender: <xms:RByTakpOPbRvfm3BxWoYj9IDCo_QdNx7vQZXCG4QGEumTWxH_P40cA>
    <xme:RByTahi41UV5ayfewE4eP3oF_eOM8lLh_djMUW0_a1y2OTerDAM_hvkRyKVaQWNed
    HZwrCNDmYEBNpJ_b4ul1wqNLIlSaxrPzHEXai8sfW3uXD_7sNIX4MA>
X-ME-Received: <xmr:RByTahiFl-gOUFdQjPtVvu4A1RAKWFjtd5366ov2mrSh5PAHCBEZG0taGAtdrIfNMg>
X-ME-Proxy-Cause: dmFkZTFeihuspVB5+kpaPDpZhLBOMvYvieQ8iNpM5ZPTxPHmOOxgoLMDuzcdFJl8NtfrCP
    FsCdwIVSfXuLFHVCKUTz4utTn6F5gdCqK9CoYOtaYUTn/Vmfe65Ih/JUXkXBS+CQa5aSZ5
    kcDJJEYhNII3ptcwFSmGbd4eqlNLRKm4CnZC51BF0VGCLyqJF7zHLa5lTYGKHjSw8HCuoz
    Oka0zwitVnv2TTVzkcTyt5qlh5pRd9/wsBUWQKxG50btR9E9B/SyKC9DpHXnhFpFHs8bTV
    XJDD2Z/HKUlWggZMQBGiziH/bnEgnEXJrXZIShuYUAGzyUJXi07Tu0RJQfhiUgS/jfj4tv
    fO5WibqQ703kSggxuLWeNugzzmNDR84z6yJgCgkhgQgr5c3NhBqNM3qiTyo8vLJ5VsEogd
    fg5tTZSxel5cNxAuMO1lKts60j5LbYxIBRDGCRsgLtepAgZ9Gi+Lme9NXO61BlmmHNMAYk
    /lbRjAnw5TzRluw4d8YOrNjxEUpo/pkf4El2QdRgCGkwbzIgK10hJ4BFnwWHfFonmQ0yMC
    K22suxWAgF8cY5+SIUE/svuVcXXh2+o9AOoYBMJXUmqIi9WDh4j/sA1/yvI+Uia54KOBaE
    3XdLtHgPvNl0zlM4B4fwZJMDKR6b2ylfFl1AsyoFZC18xKxc2Pnnm0oHyBZQ
X-ME-Proxy: <xmx:RByTanhl2DFZ7ZvVfaJDEgPNjO5aaXn0zc4XpafdzsQgRY_lYKY1jQ>
    <xmx:RByTahLBAnQ7Nx01Rn2TAyhb4c15LK_oV_bHUyiVWkIJNtTB8LNgig>
    <xmx:RByTamG6NntwoXHYHsMWSsqFUpoE30H5ue9cErkkKvdiKeDha3N8DQ>
    <xmx:RByTalTJZedm3-VaNTbB2nnJVjOlSiUYqQqmln828lVWDRJ_XYSNZw>
    <xmx:RByTai_NtjQ4TlM-CbWIbeWg-yyO9IpoDVl5P2hmBXK-pe1oFeUQJiB8>
Feedback-ID: i580e4893:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Aug 2026 13:52:03 -0400 (EDT)
From: Tingmao Wang <m@maowtm.org>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Tingmao Wang <m@maowtm.org>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v3] landlock.7, landlock_*.2: Document LANDLOCK_ADD_RULE_QUIET
Date: Sat, 29 Aug 2026 18:51:43 +0100
Message-ID: <20260829175143.144759-1-m@maowtm.org>
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

All text in this patch is copied from the kernel source except this
bit:
    .TP
    .B EINVAL
    .I flags
    is not 0 or one of the allowed values.

(the kernel says "%EINVAL: @flags is not valid", I decided to make it
more precise)

 man/man2/landlock_add_rule.2       | 49 ++++++++++++++++++++++--
 man/man2/landlock_create_ruleset.2 | 60 ++++++++++++++++++++++++++++++
 man/man7/landlock.7                | 33 +++++++++++++++-
 3 files changed, 138 insertions(+), 4 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index fe01a98d9..ec2f00356 100644
--- a/man/man2/landlock_add_rule.2
+++ b/man/man2/landlock_add_rule.2
@@ -120,7 +120,45 @@ .SH DESCRIPTION
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
@@ -159,7 +197,7 @@ .SH ERRORS
 .TP
 .B EINVAL
 .I flags
-is not 0.
+is not 0 or one of the allowed values.
 .TP
 .B EINVAL
 The rule accesses are inconsistent (i.e.,
@@ -181,10 +219,15 @@ .SH ERRORS
 .IR \%struct\~landlock_net_port_attr ,
 the port number is greater than 65535.
 .TP
+.B EINVAL
+.B LANDLOCK_ADD_RULE_QUIET
+is passed but the ruleset has no quiet access bits set
+for the corresponding rule type.
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
index 2a33fa4b5..5251a363d 100644
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
+is a bitmask of filesystem actions which should not be logged
+if the per-object quiet flag is set.
+.IP
+.I quiet_access_net
+is a bitmask of network actions which should not be logged
+if the per-object quiet flag is set.
+.IP
+.I quiet_scoped
+is a bitmask of scoped actions which should not be logged.
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
+are bitmasks of actions for which a denial by this layer
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
+\[em] if the ruleset is created with any bits set in
+.IR quiet_scoped ,
+then denial of such scoped resources will not trigger any log.
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
index 880dd5058..3db53c0a5 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -456,6 +456,34 @@ .SS Truncating files
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
+.IR "struct landlock_ruleset_attr" .
+It is also now possible to suppress logs
+for scope accesses via the
+.B quiet_scoped
+field of
+.IR "struct landlock_ruleset_attr" .
+The object is marked as quiet within a ruleset
+when at least one
+.BR landlock_add_rule (2)
+call is made for it with the
+.B LANDLOCK_ADD_RULE_QUIET
+flag, additional add-rule calls
+for the same object without this flag
+do not clear it.
 .SH VERSIONS
 Landlock was introduced in Linux 5.13.
 .P
@@ -500,6 +528,8 @@ .SH VERSIONS
 8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
 _	_	_
 9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
+_	_	_
+10	7.2	LANDLOCK_ADD_RULE_QUIET
 .TE
 .P
 Users should use the Landlock ABI version rather than the kernel version
@@ -610,6 +640,7 @@ .SH EXAMPLES
     (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v7: same
     (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v8: same
     (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v9: add "resolve_unix"
+    (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v10: same
 };
 \&
 int abi = landlock_create_ruleset(NULL, 0,
@@ -622,7 +653,7 @@ .SH EXAMPLES
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
