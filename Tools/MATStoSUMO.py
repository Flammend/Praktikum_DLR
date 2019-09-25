#!/usr/bin/env python
# Eclipse SUMO, Simulation of Urban MObility; see https://eclipse.org/sumo
# Copyright (C) 2010-2019 German Aerospace Center (DLR) and others.
# This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v2.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v20.html
# SPDX-License-Identifier: EPL-2.0

# @file    generateTurnRatios.py
# @author  Yun-Pang Floetteroed
# @date    2019-04-25
# @version $Id: generateTurnRatios.py

"""
- calculate the turn ratios or turn movements at each node
  with a given route file

- The output can be directly used as input in jtrrouter,
  where the time interval will be set for one day
"""
from __future__ import absolute_import
from __future__ import print_function

import os
import sys
import optparse
import sumolib



def get_options(args=None):
    optParser = optparse.OptionParser()
    optParser.add_option("-r", "--route-file", dest="routefile",
                         help="define the route file (mandatory)")
    optParser.add_option("-o", "--out-file", dest="outfile",
                         help="Give a outfile")
    optParser.add_option("-d", "--duration", 
                         help="Give a time, how long the vehicle stands")
    optParser.add_option("-u", "--until", 
                         help="specify a time until the vehicle is parked")
    optParser.add_option("-p", "--parking", dest="parking", action="store_true",
                         default=False, help="where is the vehicle parking")
    optParser.add_option("-v", "--verbose", dest="verbose", action="store_true",
                         default=False, help="tell me what you are doing")

    (options, args) = optParser.parse_args(args=args)

    if not options.routefile or not options.outfile:
        optParser.print_help()
        sys.exit()

    return options
   

def main(options):
    with open(options.outfile, 'w', encoding="utf8") as outf:
        idveh=0
        sumolib.writeXMLHeader(outf, "$Id$", "routes")
        for leg in sumolib.output.parse(options.routefile, 'leg'):
            if leg.mode == "car":
                outf.write('    <vehicle id="%s" depart="%s" >\n' % (idveh , leg.dep_time))
                outf.write('         <route edges="%s"/>\n' % (leg.route[0].getText()))
                outf.write('    </vehicle>')
                idveh=idveh+1

        outf.write('</routes>\n')
    outf.close()

if __name__ == "__main__":
    options = get_options(sys.argv)
    main(options)
