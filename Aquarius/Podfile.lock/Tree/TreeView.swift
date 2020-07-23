//
//  TreeView.swift
//  Aquarius
//
//  Created by Crazy凡 on 2020/1/5.
//  Copyright © 2020 Crazy凡. All rights reserved.
//

import SwiftUI

struct TreeView: View {
    @AppStorage("isIgnoreNodeDeep") private var isIgnoreNodeDeep = false

    var node: TreeNode
    var isImpactMode: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(node.pod.name + "  ")
                .foregroundColor(.primary)

                + Text((node.pod.info?.name ?? "") + "  ")
                .foregroundColor(.secondary)

                + more()
                .foregroundColor(.secondary)

            Color.secondary
                .frame(width: nil, height: 1, alignment: .leading)
        }
        .font(.system(size: 14))
        .padding(
            .leading,
            CGFloat(node.deep > 0 ? (isIgnoreNodeDeep ? 30 : node.deep * 30) : 0)
        )
    }

    private func more() -> Text {
        guard let count = node.hasMore(isImpactMode) else { return Text("") }
        return Text("\(node.isExpanded ? "▲" : "▼")·(\(count))")
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        TreeView(node: TreeNode(deep: 0, pod: Pod(podValue: "test")), isImpactMode: .random())
    }
}
