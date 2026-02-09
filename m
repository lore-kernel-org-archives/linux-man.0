Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A130FC34
	for <linux-man@vger.kernel.org>; Mon,  9 Feb 2026 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770672126; cv=none; b=TxQ6zKZCVT8x980pJgt7wDV13oNXKkD+CE0khzV4XtdTS0MIygktSRKxxgDViSW7C50D21qVyCNeDFc/nqPWfAdw3tYg4XWRX4H4aBewcIRDBHd9QNDWjfVDnAM+EXwyDtlKWWAmpNXZ8qTQXLwy3G9Rcx6e232o8dLe4upIqEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770672126; c=relaxed/simple;
	bh=SpUWHm8gZ5CceaeF0m1Ops9eD0PyJ6acr61KvSfn7Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/rwPSyJl98UzANsZs/Ageq/d9NYyUhhyi3PcxZHDl4Buqh7InaY3C5h+h8ax4I1s54z9OCP1YatZTMe8X9MV0zSlqfkmh4r2SgHELrxKo+/77VVeN88O2ng1FGqxIozsJeUC94pt3/G5rnekYAB+BhbCWaDXm8X4OXiv+8g9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc/C5V/p; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc/C5V/p"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2aae146b604so12108485ad.3
        for <linux-man@vger.kernel.org>; Mon, 09 Feb 2026 13:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770672124; x=1771276924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PasGuMIVPiX2gcgn5MIdyWsDDAUt9OP40qYIb5B3ZL4=;
        b=Zc/C5V/pNzMx+xqFPj2r81JiIYUg9ggSRUT6U+Lc91pqDjlNFT2iD1Lbhz8V9NmHLi
         LSGJCI7bOxhMD8dxznhjhHdkmkhZqV5+kBqyDu7NKMX/zdipnskLDpdbbdTS8pysiCPj
         WRVW9dZQHk2BNMbuTxZFLH5FZC3Dp/0Uo3TSiFPjwllBNsLuaY2QQocw9q7h+7bkbdM5
         65S7w1fc5NmSl0Av9n7dEFCeJetBHuEUZo1tKvdn3IZCcOyTzRBT96o3xUmKHBqMNKYb
         WoFw5UhXC9H0NM+SEtcj6TucI8VRIZCK1WUUOa8mHVt4bG57Jn1A7K27vNKfPv571cjR
         mIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770672124; x=1771276924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PasGuMIVPiX2gcgn5MIdyWsDDAUt9OP40qYIb5B3ZL4=;
        b=tl3mEa0ynwOLzGeNXulIUO40SD7tDVpfSEH5NDNyrZxi8kWushKTHvs7oGyM5bC4L7
         OlR4ku/ampKsJTLknGEyfttY5rLjmFO7SGnDuD5GDmmIDQ7kZnGYDI236AAEBdDFWE5t
         6DknZtLBhUkzbgQm6XLLSZTASiezhyHIdbNOLBsf6eZqAaRi/ituF5w4gcehRE/tG0RK
         gNUupq43b42vjX59Rck8DKtAePS0ueXFzFQ26gydW5dCot3Lve2JHCHV8hnwX2WmMh0K
         efnKFuaBdwsJVvsBDcQNkNKDD1xKtdLhIbm62zAWP6j/pC9sHvwYwzRAWCzjZ34RHkx2
         7Rbw==
X-Forwarded-Encrypted: i=1; AJvYcCUYNArRwuQvB23zeAiq7dTaR1IpYr4UMP5Wm9vy1ClFqayjp8fcxEhCAMlK0g92nHdn5Ka4B5YtkqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8fhbv8ffSQu28dE5bBvfnT5XCAPu8zT3tEN2o5LIpnqR9Dt+4
	MIV6CpMziX9LK3rMus6VYtkS6CRY5cpy4WdiW4WpZ687f604WotRR6JY
X-Gm-Gg: AZuq6aKWnu12SiG5mJgcieZOWjruUG3RWb49l6NrKDm6DfGVqQw3ay7H/mNCaofhu8c
	CtaQ+NsO0YZxBn5ZEvM9X1f1jJ10ogxYt10ZCwdxAZmgrB5ZyhsYIUHbQaedWF/azbrI6UO4HQQ
	IT4VB/zmPwV3wqfUyZik/+xNjNdS45cFR9+4nSsc3KKkwxzVc4ih7rbwhP0I4e2kl+VSZaSPT1x
	Vnu+qKO0cB/u3dL3zDTwauexChoSjoEw7f8WXmyqWkrfKtzy6BmpnJFK9M0hd7b28CQWCagXMZV
	zZxLChALCtbvBP8BasZnSmie4SIZpdjMkZ4Lg2IqA/LqrqV7lmtH0v7t+tn0lm+tZh5RROWkwfI
	hX1E4MG9bxJqIvFV6DRRlSL/fOuoHW7xNoaJJdzeFa+F+gwxuQgYdDB0a7hDjpTrN7hHkDHJ2Sn
	zbprtf+fw9K/ZOVnjdctEcK/Bv6fOFxsg/IaX25EF/WNcwLg2rZWAZDw==
X-Received: by 2002:a17:902:f68e:b0:2a0:cccf:9d24 with SMTP id d9443c01a7336-2ab105763d7mr765595ad.16.1770672124532;
        Mon, 09 Feb 2026 13:22:04 -0800 (PST)
Received: from fedora ([2405:201:3017:184:52f5:ed80:f874:1efc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521f8a50sm121346305ad.80.2026.02.09.13.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 13:22:04 -0800 (PST)
From: Bhavik Sachdev <b.sachdev1904@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Bhavik Sachdev <b.sachdev1904@gmail.com>,
	linux-man@vger.kernel.org,
	criu@lists.linux.dev,
	Andrei Vagin <avagin@gmail.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Jeff Layton <jlayton@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Josef Bacik <josef@toxicpanda.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH v1 02/10] man/man2/statmount.2: Document STATMOUNT_MNT_OPTS
Date: Tue, 10 Feb 2026 02:47:35 +0530
Message-ID: <ece6d92155a289a30e316ff0c52bb279ec9f1186.1770671863.git.b.sachdev1904@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1770671863.git.b.sachdev1904@gmail.com>
References: <cover.1770671863.git.b.sachdev1904@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document STATMOUNT_MNT_OPTS flag and the corresponding field introduced
by it.

STATMOUNT_MNT_OPTS is used to get all mount options on the mount
separated by commas. Similiar to how they are displayed in
/proc/[pid]/mountinfo.

This text is based on this commit [1].

Link [1]:
<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f9af549d1fd31487bbbc666b5b158cfc940ccc17>

Signed-off-by: Bhavik Sachdev <b.sachdev1904@gmail.com>
---
 man/man2/statmount.2 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man/man2/statmount.2 b/man/man2/statmount.2
index f5c4da122..fee37069a 100644
--- a/man/man2/statmount.2
+++ b/man/man2/statmount.2
@@ -31,6 +31,7 @@ .SH SYNOPSIS
 .P
 .B struct statmount {
 .B "    __u32  size;"
+.B "    __u32  mnt_opts;"
 .B "    __u64  mask;"
 .B "    __u32  sb_dev_major;"
 .B "    __u32  sb_dev_minor;"
@@ -108,6 +109,7 @@ .SS The mnt_id_req structure
 STATMOUNT_MNT_POINT	/* Want/got mnt_point */
 STATMOUNT_FS_TYPE	/* Want/got fs_type */
 STATMOUNT_MNT_NS_ID	/* Want/got mnt_ns_id */
+STATMOUNT_MNT_OPTS	/* Want/got mnt_opts */
 .TE
 .in
 .P
@@ -159,6 +161,13 @@ .SS The returned information
 structure,
 including any of the strings fields that were filled.
 .TP
+.I smbuf.mnt_opts
+The offset to the location in the
+.I smbuf.str
+buffer that contains a comma separated list of mount options,
+similiar to those in /proc/[pid]/mountinfo.
+It is a null-terminated string.
+.TP
 .I smbuf.mask
 The ORed combination of
 .BI STATMOUNT_ *
-- 
2.53.0

