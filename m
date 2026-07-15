Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116A62E8B9B
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084456; cv=none; b=Bk3HxeR6JuT37rBbEKUc/5RUncpjIPEYnvaz6k2HWZwwuM2f2vynkULDaByANCzWWKnR6/LvRlCAxzj1R3Wq57BEx3Ig6t5hzq1W/oiBZrTlsWc8Gt5NBRLXMHM2GLGx17ayp22c8ZZMkYmQfIW/SzAwYUORu2dxX0eGaLIUcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084456; c=relaxed/simple;
	bh=vaW3Y7JPNI/2bCDGwu9aLwcZk/xUeckmXSkcMHZIsWI=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:Content-type:
	 To; b=TZNJDK1wFc6VQ9px/hMlFc+syxHntjfYPY83OSlTbUyrI7tNoQdcWNfc0pM8NQjJJVaZhQIiFw68gPrAqqkztglnqjphcvLppVG2YQSaMk4Hu4n7udjl9tZ1NwxD9oMQQF6opu64rEDT8oDh3S/4UKIXIcVJCRvTLr31Jcric4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JV8iD2se; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JV8iD2se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=/1tgyS87hTsCSv56IkHqDhRXPd6bNOrPVee4ZrckJtQ=;
	b=JV8iD2serupLcxNEwKa16cJ/RHVU+GFe4iL/bj8a7jAROdZVO+EcmCTT8ablDHH4RagWAY
	5MdaP1rcQ7bSL4P8d+71Ms1uA1rcZe3qHNTuqT3l12VFTiy036MtoL0zBeBeCtyKQU07hb
	YF7i+azk4o5Az1src1z4zK08byVZ5K8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-160-R20zzh2OMA-2fH1HDZ84Gw-1; Tue,
 14 Jul 2026 23:00:49 -0400
X-MC-Unique: R20zzh2OMA-2fH1HDZ84Gw-1
X-Mimecast-MFC-AGG-ID: R20zzh2OMA-2fH1HDZ84Gw_1784084448
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C23D318002C3
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:48 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 775891956040
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:48 +0000 (UTC)
Received: from greed.delorie.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTPS id 66F30lqU1140975
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-man@vger.kernel.org>; Tue, 14 Jul 2026 23:00:47 -0400
Received: (from dj@localhost)
	by greed.delorie.com (8.16.1/8.16.1/Submit) id 66F30lGu1140974;
	Tue, 14 Jul 2026 23:00:47 -0400
Message-ID: <fed61f93333ec0421dc9adc5af05d740a2e4bcd7.1784084289.git.dj@redhat.com>
In-Reply-To: <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
References: <cover.1784084289.git.dj@redhat.com>
	<ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
From: DJ Delorie <dj@redhat.com>
Date: Tue, 14 Jul 2026 22:58:09 -0400
Subject: [PATCH v2 2/4] man/man5/tunables.conf: Document system-wide tunables
 config
Content-type: text/plain; charset=UTF-8
To: linux-man@vger.kernel.org
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

---
 man/man5/tunables.conf.5 | 116 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 man/man5/tunables.conf.5

diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
new file mode 100644
index 000000000..e2b31e351
--- /dev/null
+++ b/man/man5/tunables.conf.5
@@ -0,0 +1,116 @@
+.TH tunables.conf 5 (date) "Linux man-pages (unreleased)"
+.SH NAME
+tunables.conf \- tunables configuration file
+.SH SYNOPSIS
+.nf
+.B /etc/tunables.conf
+.fi
+.SH DESCRIPTION
+Each line in the file
+.I /etc/tunables.conf
+specifies a tunable,
+which is a name and value separated by an equals sign.
+.P
+For a list of valid tunables,
+please consult the glibc manual.
+.P
+The syntax allows lines to start with the word
+.I include
+followed by a path wildcard,
+and will include any files matching that wildcard.
+The wildcard is a path specification in the
+.BR \%glob (7)
+format.
+Files matching that wildcard will be processed
+as if their contents were included in the main config file.
+.P
+The file is parsed by
+.BR \%ldconfig (8)
+and the results stored in
+.IR /etc/ld.so.cache .
+The resulting data is read when a new process starts.
+.P
+Each line may include zero or more words or symbols at the beginning,
+which affect how each tunable affects each processes:
+.TP
+.B overridable
+.TQ
+.B +
+Allow the tunable to be overridden by the
+.B GLIBC_TUNABLES
+environment variable when the process runs
+(this is the default).
+.TP
+.B nonoverridable
+.TQ
+.B \-
+Do not allow the tunable to be overridden by the environment variable.
+.TP
+.B onlysecure
+.TQ
+.B @
+The tunable only applies to
+.B AT_SECURE
+processes,
+such as a set-user-ID process,
+or one with elevated capabilities.
+.TP
+.B nonsecure
+.TQ
+.B $
+The tunable only applies to
+.RB non- AT_SECURE
+processes (this is the default).
+.TP
+.B anysecure
+.TQ
+.B *
+The tunable only applies to both
+.B AT_SECURE
+and
+.RB non- AT_SECURE
+processes.
+.P
+The file may also contain
+.IR filters ,
+which limit the tunables following it,
+up to the end of the file
+(or end of the included file,
+or start of a new included file)
+or a line with only
+.B []
+on it.
+The syntax is:
+.IP
+.in +4n
+.EX
+.RI [ filter : pattern ]
+.EE
+.in
+.TP
+.B proc
+The
+.I proc
+filter limits the following tunables to processes
+whose name matches the pattern.
+The pattern may be an absolute path
+or just the base name.
+.P
+Example config file:
+.IP
+.in +4n
+.EX
+glibc.malloc.arenas_max=5
+onlysecure glibc.malloc.arenas_max=1
+\-glibc.pthread.rseq=1
+[proc:/bin/bad.program]
+\-glibc.pthread.rseq=0
+[proc:some.program]
+\-glibc.malloc.mmap_threshold=65536
+.EE
+.in
+.SH FILES
+.I /etc/ld.so.conf
+.SH SEE ALSO
+.BR ld.so (8),
+.BR ldconfig (8)
-- 
2.47.3

