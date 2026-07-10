Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837B425CFA
	for <linux-man@vger.kernel.org>; Fri, 10 Jul 2026 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721988; cv=none; b=CGct8ydFJCHrg7uDMI/BTsOTuc9XGTzAiGmXYBIAxqwVQ3PoUcr4GtVG1J54hmMwsrn1ChY9E6sif6J4c5Pt1W0QOu1k7LGhF5qMwy2HurMeqNRu6yA6KJJh7lJNjqA4EgZzGsCus2pkzGG6xcy7n/vunbbQRObkGB8P/bgSjk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721988; c=relaxed/simple;
	bh=9Auk/bv4HXIXLsUSnRU4jX5bfQM4RF73KlsR7gsIFxA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=S+U2ehwmU5J0NFTs2ppYImiuJjlxFYEqDt9gGE+UaY6RmdhwXYlIL+wnBY1VV2rAHoV3YmoINbqyVLNkeomlrvvn4Pz3S33xasXUFzI0iesT0NXPQep4naxEMKYoC6fEy1sN1Xl43AYrfXYW6PLIypsKjTGgj3Nkn39BwMFQ100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzyh3+z1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzyh3+z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783721985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=9Auk/bv4HXIXLsUSnRU4jX5bfQM4RF73KlsR7gsIFxA=;
	b=hzyh3+z1J8cWW2sfRNV0ZjaVJkJOsAkMV1hBAeQI4kk+M05vWXDhIeUyuErAShPq4CU/1O
	gGHN40tq5EGdZzh+e3TMzjJQ5CXWUXEFKEqH/Xn8jUjWUu4rVoWwSgjhzvqQT4/T/ja3Pj
	E3nMfSpAMaJ2+45FF9uGZA4LnVdIoNw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-9LCrk20SPE-aZahx5DrPbg-1; Fri,
 10 Jul 2026 18:19:42 -0400
X-MC-Unique: 9LCrk20SPE-aZahx5DrPbg-1
X-Mimecast-MFC-AGG-ID: 9LCrk20SPE-aZahx5DrPbg_1783721981
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CEA31955F7A;
	Fri, 10 Jul 2026 22:19:41 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0E54180059A;
	Fri, 10 Jul 2026 22:19:40 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66AMJdEa778862;
	Fri, 10 Jul 2026 18:19:39 -0400
From: DJ Delorie <dj@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: Why we're stuck with man(7) (was: man/man8/ldconfig.8: document
 system-wide tunables)
In-Reply-To: <20260710195854.ud4riftmhrfzu54d@illithid>
 (g.branden.robinson@gmail.com)
Date: Fri, 10 Jul 2026 18:19:39 -0400
Message-ID: <xno6ge8p38.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


> Is there a canonical reference to the flavor of roff that we write to,
> for modern systems' man page formatters?

Nevermind, found it...

