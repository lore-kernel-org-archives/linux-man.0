Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155CA42FCBC
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213506; cv=none; b=VgP7G+eOTdoStvYlFYsSwadmaSZdszLrfLOiJT9gozOkEAbKhzZpRp1WZq0FpdPmlvUnL+muX/Xt8InUZJ/MM+4HAPgUY7R+u5J5X2ZkBLGojiXuspbRZbxHWsm7JnsmpEs/eyxUa1pqx7OhDpIyvvVNnKeylX+s3iUNRraw2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213506; c=relaxed/simple;
	bh=nl7WRqGj5+9zm4sicIWJdiYe15qGOVrntQuintTXRxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hmq8bauIGW6q/HOT/0l0iLQry6B5eS81bF/s93Q3OpOM9YnAe03xZyxHdhs0JbmDZYIaOPp3vcl2AsZqZdeEqya4JxdWwDhfjejSui51QGAHoe2UJJn+Or1rdIsEV4PwMr5MifX0Cr/WI/0p3HuVwS5K6ONYK+MSqZdChvRSYa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=compilercrim.es; spf=pass smtp.mailfrom=compilercrim.es; dkim=pass (2048-bit key) header.d=compilercrim.es header.i=@compilercrim.es header.b=8qlA+Alc; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=compilercrim.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compilercrim.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=compilercrim.es header.i=@compilercrim.es header.b="8qlA+Alc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=compilercrim.es;
	s=key1; t=1784213500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iu3j6MnAbFQaGKwnsyE6N2IlSC5bJabns7q3QOVEEDY=;
	b=8qlA+AlcHN1LLsBKYo+JTSDeWqxDqhABG/z/UjgaOqqAaSaPkMGyS8YFJN7gj1nEHDFbJw
	n5OyxN2HVz1C5hQK4s0WrI2qrHh4+bsuJVyGgk0Cv3Mo/d5jxUxt3SijiEjhzkC04nf2rH
	i81Z4QYqpzIQLX048bp6TOwCxPTlVT/q8yG4HPuvuw5kHP6s0ZkM9w/eQfL2di+3TE6Ivw
	blCC0K3as6fWvS030y4N4H/l7TjNcEaYvukTLPpm0WPcW0Cn1I7Xp8/lQF3JorvxE7uAzs
	lMuJ8gcioVOA0BmJCB1QzcngAz6oeCErYJfFbNTJ4KA4teVHxnTrhe0w7wwNHA==
From: =?UTF-8?q?Maja=20K=C4=85dzio=C5=82ka?= <maya@compilercrim.es>
To: Alejandro Colomar <alx@kernel.org>
Cc: =?UTF-8?q?Maja=20K=C4=85dzio=C5=82ka?= <maya@compilercrim.es>,
	linux-man@vger.kernel.org,
	Kalesh Singh <kaleshsingh@google.com>
Subject: [PATCH] man/man5/proc_pid_fdinfo.5: document the ino field
Date: Thu, 16 Jul 2026 16:51:07 +0200
Message-ID: <7eeaa92f7a7cc14024a6474d4cc117e875185f6d.1784211190.git.maya@compilercrim.es>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Also expands the tabs into spaces where relevant, in order to ensure
proper alignment between the fields when rendered by man.

Signed-off-by: Maja Kądziołka <maya@compilercrim.es>
Cc: Kalesh Singh <kaleshsingh@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 46 ++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 93c6cf269f31..f93b69c6c59d 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -24,6 +24,7 @@ For regular files and directories, we see something like:
 pos:    1000
 flags:  01002002
 mnt_id: 21
+ino:    63107
 .EE
 .in
 .P
@@ -51,9 +52,14 @@ rather than the current setting of the close-on-exec flag.
 .I mnt_id
 This field, present since Linux 3.15,
 .\" commit 49d063cb353265c3af701bab215ac438ca7df36d
-is the ID of the mount containing this file.
+is the decimal ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
+.TP
+.I ino
+This field, present since Linux 5.14,
+.\" commit 3845f256a8b527127bfbd4ced21e93d9e89aa6d7
+is the decimal inode number of the file.
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -63,9 +69,10 @@ the following fields:
 .P
 .in +4n
 .EX
-pos:	0
-flags:	02
-mnt_id:	10
+pos:    0
+flags:  02
+mnt_id: 10
+ino:    63107
 eventfd\-count:               40
 .EE
 .in
@@ -81,9 +88,10 @@ the following fields:
 .P
 .in +4n
 .EX
-pos:	0
-flags:	02
-mnt_id:	10
+pos:    0
+flags:  02
+mnt_id: 10
+ino:    63107
 tfd:        9 events:       19 data: 74253d2500000009
 tfd:        7 events:       19 data: 74253d2500000007
 .EE
@@ -114,10 +122,11 @@ the following fields:
 .P
 .in +4n
 .EX
-pos:	0
-flags:	02
-mnt_id:	10
-sigmask:	0000000000000006
+pos:    0
+flags:  02
+mnt_id: 10
+ino:    63107
+sigmask:        0000000000000006
 .EE
 .in
 .P
@@ -138,9 +147,10 @@ the following fields:
 .P
 .in +4n
 .EX
-pos:	0
-flags:	00
-mnt_id:	11
+pos:    0
+flags:  00
+mnt_id: 11
+ino:    63107
 inotify wd:2 ino:7ef82a sdev:800001 mask:800afff ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:2af87e00220ffd73
 inotify wd:1 ino:192627 sdev:800001 mask:800afff ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:27261900802dfd73
 .EE
@@ -176,9 +186,10 @@ the following fields:
 .P
 .in +4n
 .EX
-pos:	0
-flags:	02
-mnt_id:	11
+pos:    0
+flags:  02
+mnt_id: 11
+ino:    63107
 fanotify flags:0 event\-flags:88002
 fanotify ino:19264f sdev:800001 mflags:0 mask:1 ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:4f261900a82dfd73
 .EE
@@ -232,6 +243,7 @@ the following fields:
 pos:    0
 flags:  02004002
 mnt_id: 13
+ino:    63107
 clockid: 0
 ticks: 0
 settime flags: 03
-- 
2.54.0

