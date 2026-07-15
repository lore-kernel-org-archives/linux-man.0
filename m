Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2910C25776
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 02:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784082865; cv=none; b=mG2a2KsWDL0h+TofL0IzwaBxXee2wLtLI301mwawSClSH7dfKjNC10+D929RIuC5XblYADM6jIC/jDMEvV/Aj2Sw+uudeRdpX8SEW+YS2LJ9K3k/DtMnDf7XI3wdf1KApQjlFKO6BIB5eBY1fTdbs+B/1M11X0GoL0XhDNHdmxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784082865; c=relaxed/simple;
	bh=bEtmzQcSijG/1S0Hwc0kKJHt6Hl37l0yaXC2QV3u7tU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=APEsdHFxFUpqQ9aL42MzMU0flGfDNiB/tjvQ0l9XhwXtA9c8LgdqYveB/CDPgzNzK8Rbifv1v1fEOx5cLdzlM67kZXqq/vKkL3WseUyMUVTfqs8aJeywRFwtK6Qyn7xW4nbYzF4PbznxwfC8SlZzZsEhKd4tWfl8tpLqM+Ub1Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C6Y905QT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C6Y905QT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784082863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=L0zjMkdqG7wyaIzrnBUPn9cEMAefD2MafZeve9jAJwc=;
	b=C6Y905QTAMsIIc3VmebAB+9DASngKDU8j0bUsnmxm5RCgaPIYkq+YurkxcrQYhXEiz4Dmh
	3mehBttFKq7l2RehVp4q2KaRHXlqGbS+4390Q+7pJhIPMiYImabcSRtLRzs4w04pzmTl8B
	zRjJerUNCbVZYtcr4QROqa5+fbhgelM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-C00Q94VsNPGXfVfeKYemKg-1; Tue,
 14 Jul 2026 22:34:19 -0400
X-MC-Unique: C00Q94VsNPGXfVfeKYemKg-1
X-Mimecast-MFC-AGG-ID: C00Q94VsNPGXfVfeKYemKg_1784082858
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 218FB195605E;
	Wed, 15 Jul 2026 02:34:18 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D3B191956086;
	Wed, 15 Jul 2026 02:34:17 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66F2YFPm1138880;
	Tue, 14 Jul 2026 22:34:16 -0400
From: DJ Delorie <dj@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
In-Reply-To: <20260714065637.gzccx2gluxfa2cen@illithid>
 (g.branden.robinson@gmail.com)
Date: Tue, 14 Jul 2026 22:34:15 -0400
Message-ID: <xnzezt6kwo.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
> That link remains a good pr=C3=A9cis of the problem.  One could show up my
> man(7) composition abilities and earn my gratitude by solving that
> constraint problem using only macros from the package.  :)

We already process all the raw files to fill in the date and version.
Add the .in macros around .EX there?

There are 1528 .EX's in the tree, but a short perl script should be able
to fix them all up.  Note: there are 336 .EX's that do not have the .in,
and two .EX's that do not have a closing .EE.

Turns out Gemini is good at perl.

Anyway, doing this as a postprocessor would let us purge the hacks and
make .EX/.EE properly semantic again, while retaining our desired
appearance.  It's also one more bit of folklore new authors won't need
to learn ;-)

