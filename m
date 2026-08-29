Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C2F2F84F
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015156; cv=none; b=ZiyzB4pdvTnWKvOG/czINVSuXu6c22YLcYVGZ0aY605r3EEJ5DhOn1ioT9F7NBSKYf1malpkVc7soWi8VtqlAL6E6nOxHoveozah4QPYcaBXCFdABTbAvSJlv01fQF5ywGDfRm9FA13fibO94KJ8Sd5iGvS6WL750G3AuNcNlaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015156; c=relaxed/simple;
	bh=pkJ3E4waHR8+TPsX4GHhlUO6PVuHxrUHw5GAo1ljigA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ujz3+Hp6PGgqNelbOy8fR0sY0t0a+FgFwR76Xq+OMaxB2Ng+YvaRK0RDFEHTgX8ZvuEiozhzsH4Ert6Ky7Yo+TEnkTBOWwHYsUDjRcd5VdnlUhjuvhVucsGqdW3o4IbwftkHlASq55+A11cxbs/35Q/w8w1XV36K1SeQgL1FNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org; spf=pass smtp.mailfrom=maowtm.org; dkim=pass (2048-bit key) header.d=maowtm.org header.i=@maowtm.org header.b=eDCzsnCL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Svdj5V70; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maowtm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maowtm.org header.i=@maowtm.org header.b="eDCzsnCL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Svdj5V70"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id C74751D00036;
	Sat, 29 Aug 2026 10:52:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 29 Aug 2026 10:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maowtm.org; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1788015152; x=1788101552; bh=z8
	UkHq9UtIFkGRRUFzuKaTc3MeljqMCFx1+35RKq01Q=; b=eDCzsnCLQBq1fMoCUz
	8J8GFCIfUZnr+CjUAiIYsefqqsguYHUMOPyTtOAQPvJbs82cV4Lh8SAYR+vIEAC3
	WrlzDi9IkxMTumm1RWvNxMXBQR9y+Ps5NTrBrNuWwpvwzPcnDKaNwXZSjbQxtonr
	ZsqDWd+pnoULh4RZEE3wZ30kgdPgNkwAAB7Y+G9eWSeBK+cWch+yd13/a/wM21hW
	ThZ9Q6xMYHn5Wtz7DfRf+LGGUz9smTkOHGT1QwgPLDDoXJdOk4XGW5faRupecTrP
	tHMw1d6UHeZ56/FGkO0pDFzczbOmvDjigGHzuHdjEEnwxZswBd8kkwDD2GE5OZYc
	D0yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1788015152; x=1788101552; bh=z8UkHq9UtIFkGRRUFzuKaTc3Melj
	qMCFx1+35RKq01Q=; b=Svdj5V70lsZrRfie8oQUqsKNdV6OVQQZ62SMW2oEEyAl
	q1ZL0sFvDfMeG8elgSEhqSPH/goVQd8D/4bJcgMRq1AuxpgEBcuJ7bTEp9KayZuh
	u2XKGM6L7xSRdA2UDOyGfyPq6HELKcgdtG15FQP0U9LFfFtbpm+q9NF0QCJ7b15L
	Uk9oIh2UKRqmS9xQEsSdU8lhSh1DB/OzAtrrUIku9H8GgKD0Ov6pNVP/aRfkyUSW
	vk1djSgJ73YTapG0VJsoZk+3oLiLIgTn93aT4FikNajk5DhCdtJBlOrvgog7LF9t
	FXZBuokeKrRdHe6URGjRfrH+k39TXh6ZcHD03y4xBQ==
X-ME-Sender: <xms:MPKSasOziLgh6ptyDUnYQpHtJHoLge_ZfmrIgc7S0Jg8V7A79xHWQA>
    <xme:MPKSap2iplBz911Wn9LTsbX4F2W7HJOXwqCd4FrH9cgsB7EsLITzhJzTdGV3qCV4Q
    ihOTUzfYTSZDObaZVLQhn8JuwwarVM1Z5I9vnyfisDNZyXxESZZKrG3>
X-ME-Received: <xmr:MPKSarnd2r5NAIih85_ktIaGlF6eHohCZJq8wVSgVlOhs0_XDHgC7qXnvtFYOPcyyg>
X-ME-Proxy-Cause: dmFkZTEM0tMz+sWscP83Zck4q+cv85bLDlavo8IHn2OP625HUUF43a3tDsbbXYcosx+nh4
    9JxyJonDEl0VGUvE+q1w56pjMQ3chZLJKg+Vt/9duuCC4R5tSpxs3fMFqsGfN+cj7TAVaJ
    LsPk/CcS5SbJVTWwFisLTWX91mkAd3CoQiHZ8ItrwdE6+enATPbhtlb/ocZ/CN48lAcOuE
    31bcKFO5MWQZVysChZH1scT1zlT/dpQU3ytFuXet2t2EFrTPGFo2rDhgiTxK6/k4yMAaXx
    MjXYXARi8cHgsRQtiyHTLwsjAU0Klrd0KxIYEdfGTARAoNDAAn/se/6YVApHgF0lUj1eWd
    qX+vgPLLW7O/adB1PkSbl9xaAKZxzZREKyysZZTlpw/LDz6F7ptA8JFwTKfpbZd45Yu6sh
    MeEUgaKhZNlFsIltsHnXsVmF5QSYCd2P69vkO2kOl9IEJ16NEPUPtO7otuVnHAE+cUbFOO
    7AYIqr8Ydk9rpWOeK3LTtacXCEjPNT+cMO/GndbBbkvGQOXRiCFSQNKal9PEnS6HzRuEs6
    4TTRv8nKIizar8PO5LnzOlLPeJjGdiYP0gcjoqFXz05r9opn6DRmiKExALcIDWC+s6PQfT
    K4JQwDIx0kV56g/8Kcb3qXsRUkKhSd7wM7pl7NRYmTy3Urre4U11b96ge0iA
X-ME-Proxy: <xmx:MPKSagXIkUB1pzFEzFPHu86TA9SRzwBjIzF2adh8s6PWHLnrGiiEEg>
    <xmx:MPKSahtleGee1jq6fs3oyrpTX8wHm-H4jN8YgCn9sj4wuAZs_IEePg>
    <xmx:MPKSajao-duHAZLbBCQzQGfQPyxdrWQuwJpbSU_6mmFwVydZ0aKFsg>
    <xmx:MPKSagVrbjJeqEQyIyJB6DZEembrd8ZsS6vjG9IgkWQfTVaBBePKzQ>
    <xmx:MPKSatwjxVlPWweTtZtb2kCPRcXZxC7gW3jKS4zeUee1ayhr7GSnhRN6>
Feedback-ID: i580e4893:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Aug 2026 10:52:31 -0400 (EDT)
From: Tingmao Wang <m@maowtm.org>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Tingmao Wang <m@maowtm.org>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH] landlock.7, landlock_*.2: Document LANDLOCK_ADD_RULE_QUIET
Date: Sat, 29 Aug 2026 15:52:07 +0100
Message-ID: <20260829145209.98783-1-m@maowtm.org>
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

 man/man2/landlock_add_rule.2       | 46 ++++++++++++++++++++++++++--
 man/man2/landlock_create_ruleset.2 | 48 ++++++++++++++++++++++++++++++
 man/man7/landlock.7                | 27 +++++++++++++++++
 3 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index fe01a98d9..7b5a41161 100644
--- a/man/man2/landlock_add_rule.2
+++ b/man/man2/landlock_add_rule.2
@@ -120,7 +120,43 @@ .SH DESCRIPTION
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
@@ -159,7 +195,7 @@ .SH ERRORS
 .TP
 .B EINVAL
 .I flags
-is not 0.
+is not 0 or one of the allowed values.
 .TP
 .B EINVAL
 The rule accesses are inconsistent (i.e.,
@@ -180,11 +216,15 @@ .SH ERRORS
 In
 .IR \%struct\~landlock_net_port_attr ,
 the port number is greater than 65535.
+.TP EINVAL
+.B LANDLOCK_ADD_RULE_QUIET
+is passed but the ruleset has no quiet access bits set for the
+corresponding rule type.
 .TP
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
index 880dd5058..1d2fa5ef6 100644
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
-- 
2.55.0

