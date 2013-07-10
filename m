From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH] socket.7: add description for SO_BUSY_POLL
Date: Wed, 10 Jul 2013 12:55:19 +0000
Message-ID: <u0lr4f6h8w8.fsf@orc05.imf.au.dk>
References: <20130710121745.13118.86907.stgit@ladj378.jer.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Eliezer Tamir <eliezer.tamir@linux.intel.com> writes:

> +While busy polling my improve latency of some application, care must be
> +taken when using it since this will increase both CPU utilization power usage.

s/my/may/; missing 'and' before 'power usage'. [And should
'application' be plural?]

Rasmus
